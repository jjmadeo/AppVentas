USE [SALES]
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Ventas]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Ventas]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[usuarios]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Tarjetas]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Sucursales]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProductoSucursalRela]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[ProductoSucursalRela]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[productos]
GO
/****** Object:  Table [dbo].[PDU]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[PDU]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Empleados]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[DetalleVenta]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Categorias]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 04/06/2020 18:38:17 ******/
DROP TABLE [dbo].[Auditoria]
GO
USE [master]
GO
/****** Object:  Database [SALES]    Script Date: 04/06/2020 18:38:17 ******/
DROP DATABASE [SALES]
GO
/****** Object:  Database [SALES]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Auditoria]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 04/06/2020 18:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[id_venta] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[valor] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[PDU]    Script Date: 04/06/2020 18:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDU](
	[PDUCLAVE] [nvarchar](500) NOT NULL,
	[PDUVALOR] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[ProductoSucursalRela]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Sucursales]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 04/06/2020 18:38:17 ******/
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
/****** Object:  Table [dbo].[Ventas]    Script Date: 04/06/2020 18:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_empl] [int] NULL,
	[id_usua] [int] NULL,
	[Medio_Pago] [nvarchar](50) NULL,
	[nombreClie] [nvarchar](50) NULL,
	[cuilClie] [nvarchar](50) NULL,
	[DireccionClie] [nvarchar](150) NULL,
	[fecha] [smalldatetime] NULL,
	[total] [nvarchar](50) NULL,
	[id_sucursal] [int] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auditoria] ON 
GO
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (1002, N'EMPL', N'jjmadeo', N'Se esta creando al Empleado ==>jjmadeo1234 con rol ==>2  Sucursal del nuevo Empleado ==>4 ', CAST(N'2020-06-04T18:03:00' AS SmallDateTime), 1, 3)
GO
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (1003, N'EMPL', N'jjmadeo', N'Usted esta eliminando al empleado con Id =>1025', CAST(N'2020-06-04T18:15:00' AS SmallDateTime), 1, 3)
GO
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (1004, N'EMPL', N'jjmadeo', N'Se ah actualizado   Al usaurio =>jjmadeo12 Nuevos Datos(7-Juan Jose-2-)', CAST(N'2020-06-04T18:37:00' AS SmallDateTime), 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Auditoria] OFF
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
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (4, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (4, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (4, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (5, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (5, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (5, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (6, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (6, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (6, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (7, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (7, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (7, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (8, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (8, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (8, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (9, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (9, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (9, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (10, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (10, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (10, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (11, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (11, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (11, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (12, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (12, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (12, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1002, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1002, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1002, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1003, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1003, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 1, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 8, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 8, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 8, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 8, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 8, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1005, 332, 8, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1006, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1011, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1012, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1028, 329, 2, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1028, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1029, 329, 2, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1029, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1029, 329, 2, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1029, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1030, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1030, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1030, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1031, 327, 3, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1031, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1032, 327, 3, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1032, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1032, 327, 3, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1032, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1033, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1033, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1034, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1034, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1034, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1034, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1035, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1035, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1035, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1035, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1035, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1035, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1036, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1037, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1038, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1039, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1039, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1040, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1040, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1040, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1041, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1041, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1041, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1041, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1042, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1042, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1042, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1042, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1042, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1043, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1043, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1043, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1043, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1043, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1043, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1044, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1045, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1046, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1047, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1048, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1049, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (13, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (13, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (13, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (14, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (14, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (14, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (15, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (15, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (15, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (16, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (16, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (16, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (17, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (17, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (17, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (18, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (18, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (18, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (19, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (19, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (19, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (20, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (20, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (20, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (21, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (21, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (21, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (22, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (22, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (22, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (23, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (23, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (23, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (24, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (24, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (24, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (25, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (25, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (25, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (26, 335, 5, N'32223')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (26, 336, 35, N'988')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (26, 337, 65, N'356')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1050, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1051, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1052, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1053, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1054, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1055, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1056, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 332, 2, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 332, 2, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 332, 2, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 332, 2, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1058, 332, 2, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1059, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1060, 332, 3, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1061, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1061, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1064, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1064, 326, 2, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1003, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1003, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1004, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1004, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1004, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1004, 332, 1, N'899')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1007, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1007, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1007, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1007, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1008, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1009, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1010, 330, 1, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1013, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1013, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1014, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1014, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1014, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1014, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1015, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1015, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1015, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1015, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1015, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1015, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1016, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1017, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1018, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1019, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1020, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1021, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1022, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1023, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1024, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1025, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1026, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 329, 1, N'4199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1027, 330, 2, N'2149')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1057, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1057, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1057, 327, 1, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1057, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1062, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 327, 2, N'5199')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 326, 1, N'2999')
GO
INSERT [dbo].[DetalleVenta] ([id_venta], [id_producto], [cantidad], [valor]) VALUES (1063, 327, 2, N'5199')
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (3, N'Juan jose', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 1, 5, N'jjmadeo')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (22, N'Maria Adriazola', N'B2-9F-17-90-49-41-5C-CD-DF-46-38-7B-3B-1E-7A-D9', 2, 7, N'madriazola')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (23, N'Juan Jose', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 2, 6, N'jjmadeo1')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (25, N'Venta Onlie', N'', 2, 10, N'online')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (26, N'JuanJose Madeo Prueba 2', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 1, 7, N'jjmade3')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (29, N'Andres chimuris', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', 1, 7, N'achimuris')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (1024, N'Juan Jose', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 2, 7, N'jjmadeo12')
GO
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
INSERT [dbo].[PDU] ([PDUCLAVE], [PDUVALOR]) VALUES (N'provTarjeta', N'40')
GO
INSERT [dbo].[PDU] ([PDUCLAVE], [PDUVALOR]) VALUES (N'idUserVentaOnline', N'25')
GO
INSERT [dbo].[PDU] ([PDUCLAVE], [PDUVALOR]) VALUES (N'ClaveToken', N'asdasdasdasdasgsaherezdasdcsadsadasdasdsadasdsadssssssssssssssssssssssadasdadasd')
GO
INSERT [dbo].[PDU] ([PDUCLAVE], [PDUVALOR]) VALUES (N'SucursalOnline', N'10')
GO
SET IDENTITY_INSERT [dbo].[productos] ON 
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (326, N'REMERA NIKE BREATHE SQUADE', N'La remera Nike Breathe Squad no puede faltarte nunca en tus entrenamientos. Confeccionada con materiales livianos y antitranspirantes, incorpora una tela de red en la espalda que ayuda a mantenerte seco y cómodo. El calce ceñido tiene un corte personalizado.', 2999, 300, 20200, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557893-1000-1000/BQ3770011_1.jpg?v=637262717909530000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (327, N'PANTALON NIKE FLEX STRIKE', N'Exhibí tu velocidad con un estilo de arte callejero. Los pantalones Nike Flex strike están confeccionados con tecnología Nike Flex que se estira con tu cuerpo y brinda máxima elasticidad y abrigo que no impedirán tus movimientos en el campo. Los detalles inspirados en la pintura en aerosol agregan un toque de estilo de arte callejero. La cintura Nick Flyvent está hecha de tela de red elástica para mayor ventilación. El Fast Fit se agarra a tus piernas para ofrecer una sensación aerodinámica. Los bolsillos laterales con cierre brindan un almacenamiento seguro.', 5199, 130, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557927-1000-1000/CD7775010_1.jpg?v=637262718242230000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (329, N'CAMPERA NIKE DRY ACADEMY I96', N'Preparate para salir a la cancha con la campera Nike DryAcademy I96. El diseño icónico de bloques de colores está confeccionado con tela suave con la cantidad justa de elasticidad. Los bolsillos con cierre almacenan tus elementos esenciales y ofrecen abrigo a tus manos. La tecnología Dri-FIT te ayuda mantenerte seco, cómodo y concentrado.', 4199, 56, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557888-1000-1000/AV5414010_1.jpg?v=637262717866370000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (330, N'REMERA NIKE BOCA JUNIORS', N'Entrená o alentá a tu equipo con la Remera Nike Boca Juniors. Confeccionada con materiales de alta calidad, es ideal para usar tanto dentro como fuera de la cancha.
', 2149, 35, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557830-1000-1000/AQ1527739_1.jpg?v=637262717285930000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (332, N'SHORT NIKE BOCA JUNIORS', N'Shoty de boca', 899, 10, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557824-540-540/AO8392492_1.jpg?v=637262717225570000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (333, N'CAMPERA NIKE FC BARCELONA I96', N'Campera Barcelona', 6299, 0, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557818-540-540/AO7514451_1.jpg?v=637262717175830000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (334, N'BOLSO LOTTO DELTA PLUS MEDIUM', N'bolso lotto', 2199, 3, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/557772-540-540/601-0563-059_zoom1.jpg?v=637261976870700000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (335, N'MOCHILA LOTTO DELTA PLUS', N'mochila', 2199, 20, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/557763-540-540/601-0565-002_zoom1.jpg?v=637261959891500000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (336, N'BOTINES TOPPER STINGRAY MACH 1', N'botines topper', 2849, 300, 20200529, 1, 7, N'https://dexter.vteximg.com.br/arquivos/ids/558528-540-540/TO51446_1.jpg?v=637262824657430000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (337, N'BOTINES NIKE PHANTOM VENOM PRO FG', N'botines nike', 11299, 120, 20200529, 0, 7, N'https://dexter.vteximg.com.br/arquivos/ids/557632-540-540/IMG_1115.jpg?v=637253995206470000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (338, N'BOTINES NIKE PHANTOM VISION PRO DF FG', N'botines kine', 11299, 10, 20200529, 1, 7, N'https://dexter.vteximg.com.br/arquivos/ids/557650-540-540/IMG_1165.jpg?v=637254004418430000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (339, N'BOTINES NIKE PHANTOM VENOM ACADEMY FG', N'botines nike', 7299, 35, 20200529, 1, 7, N'https://dexter.vteximg.com.br/arquivos/ids/557638-540-540/IMG_1144.jpg?v=637253997523900000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (340, N'PELOTA ADIDAS RIVER PLATE', N'pelota', 2549, 693, 20200529, 1, 6, N'https://dexter.vteximg.com.br/arquivos/ids/557551-540-540/IMG_1013.jpg?v=637250721333900000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (341, N'GORRO NIKE FC BARCELONA', N'Gorro Nike Fc Barcelona', 1999, 32, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/548635-1000-1000/BV4073455_1.jpg?v=637197175394330000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (342, N'MEDIAS ADIDAS SANTOS', N'medias adidas', 899, 32, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/548595-540-540/ADCV8106_1.jpg?v=637197174981600000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (343, N'MEDIAS ADIDAS SOCK 18', N'medias adidas', 899, 99, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/548593-540-540/ADCF3582_1.jpg?v=637197174963330000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (344, N'MUÑEQUERAS NIKE SWOOSH', N'muñequeras', 899, 13, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/398032-540-540/AC2286924_1.jpg?v=636706251181130000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (345, N'MUÑEQUERAS NIKE SWOOSH', N'muñequea', 1299, 22, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/398034-540-540/AC2287313_1.jpg?v=636706251198370000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (346, N'CANILLERA NIKE GUARD', N'canilleras', 1479, 22, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/205080-540-540/SP0040009_1.jpg?v=635687882066070000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (347, N'CANILLERA PUMA EVOFORCE III', N'canilleras', 799, 1, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/322568-540-540/PU030636-01_1.jpg?v=636435066996230000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (348, N'GUANTE UNDER ARMOUR TRAINING GLOVE', N'guantes sin dedos', 2199, 32, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/489140-540-540/UA1328620012_1.jpg?v=637020811958970000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (349, N'
GUANTE NIKE MATCH', N'guantes arquero', 2499, 15, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/476473-540-540/GS3370657_1.jpg?v=636972399545030000')
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (350, N'PALO DE HOCKEY MALIK COMPO SQUARE 6 36.5', N'palo ', 4199, 25, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/380246-540-540/MK01365218_1.jpg?v=636646722087800000')
GO
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 4, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 5, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 6, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 7, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 4, 13)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 5, 13)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 6, 13)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 7, 13)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 4, 24)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 5, 24)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 6, 24)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 7, 24)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 4, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 5, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 6, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 7, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 4, 64)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 5, 64)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 6, 64)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 7, 64)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 4, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 5, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 6, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 7, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 4, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 5, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 6, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 7, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 4, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 5, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 6, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 7, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 4, 34)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 5, 34)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 6, 34)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 7, 34)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 4, 2)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 5, 2)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 6, 2)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 7, 2)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 4, 39)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 5, 39)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 6, 39)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 7, 39)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 4, 166)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 5, 166)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 6, 166)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 7, 166)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 4, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 5, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 6, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 7, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 4, 19)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 5, 19)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 6, 19)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 7, 19)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 4, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 5, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 6, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 7, 32)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 4, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 5, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 6, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 7, 1)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 4, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 5, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 6, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 7, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 4, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 5, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 6, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 7, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 4, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 5, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 6, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 7, 0)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 4, 369)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 5, 369)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 6, 369)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 7, 369)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 4, 36)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 5, 36)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 6, 36)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 7, 36)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 4, 3)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 5, 3)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 6, 3)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 7, 3)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 4, 9)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 5, 9)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 6, 9)
GO
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 7, 9)
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
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (4, N'Deportes Lomas', N'32599653', N'Alen Doble  188')
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (5, N'Deporte llavallol', N'30252252236995', N'bahia blanca 234')
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (6, N'adrogue Deportes', N'24811532', N'almt Brown 3598')
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (7, N'megatlon', N'359896532', N'lberdi 1623')
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (10, N'VentaOnlien', N'99999999', N'VentaOnline')
GO
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
GO
INSERT [dbo].[Tarjetas] ([nTarjeta], [fechaVencimiento], [nombre], [pin], [id_usuario]) VALUES (N'1232132132132132', 1623, N'Sergio Valdez', 985, 50)
GO
INSERT [dbo].[Tarjetas] ([nTarjeta], [fechaVencimiento], [nombre], [pin], [id_usuario]) VALUES (N'1232132133213331', 1623, N'MADEO JUAN JOSE', 985, 51)
GO
INSERT [dbo].[Tarjetas] ([nTarjeta], [fechaVencimiento], [nombre], [pin], [id_usuario]) VALUES (N'1546431222222999', 323, N'MADEO JUAN JOSE', 985, 49)
GO
INSERT [dbo].[Tarjetas] ([nTarjeta], [fechaVencimiento], [nombre], [pin], [id_usuario]) VALUES (N'1623987865443212', 1623, N'MADEO JUAN JOSE', 985, 49)
GO
INSERT [dbo].[Tarjetas] ([nTarjeta], [fechaVencimiento], [nombre], [pin], [id_usuario]) VALUES (N'3457882124233333', 1623, N'Maria Adriazola', 985, 52)
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (49, N'juan', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'jjmadeo@gmail.com', N'Alberdi 1637 , Luis Guillon', N'Juan Jose')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (50, N'svaldez', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'svaldez@gmail.com', N'Presidente Peron 1661,Adrogue', N'Sergio Valdez')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (51, N'mta', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'madriazola@gmail.com', N'Piedra Buena 1234', N'Maria Adriazola')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (52, N'juan1', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'jjmadeo@gmail.com', N'alma fuerte 200', N'Juan Jose')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (1048, N'matias', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'Juan Jose', N'alma fuerte 200', N'jjmadeo@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:07:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (4, 3, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:15:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (5, 3, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:20:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (6, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:47:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (7, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:47:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (8, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:47:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (9, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:47:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (10, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:48:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (11, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T00:48:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (12, 22, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:03:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (13, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (14, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (15, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (16, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (17, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (18, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (19, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (20, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (21, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (22, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (23, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (24, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (25, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (26, 22, 49, N'DEBITO', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-05-31T01:05:00' AS SmallDateTime), N'3596236', 7)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1002, 25, 49, N'Efectivo', N'MADEO JUAN JOSE', N'20385897001', N'Alberdi 1637  Luis Guillon', CAST(N'2020-06-03T19:51:00' AS SmallDateTime), N'3596236', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1003, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-03T21:56:00' AS SmallDateTime), N'14546', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1004, 23, 0, N'CREDITO', N'juan jose madeo', N'38589700', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-03T22:01:00' AS SmallDateTime), N'12446', 6)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1005, 23, 0, N'CREDITO', N'juan jose madeo', N'38589700', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-03T22:03:00' AS SmallDateTime), N'18739', 6)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1006, 23, 0, N'DEBITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T12:44:00' AS SmallDateTime), N'5199', 6)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1007, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T12:54:00' AS SmallDateTime), N'14546', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1008, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T12:54:00' AS SmallDateTime), N'14546', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1009, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T12:54:00' AS SmallDateTime), N'14546', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1010, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T12:55:00' AS SmallDateTime), N'14546', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1011, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T12:57:00' AS SmallDateTime), N'14546', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1012, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:15:00' AS SmallDateTime), N'6348', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1013, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1014, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1015, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1016, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1017, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1018, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1019, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1020, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1021, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1022, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1023, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1024, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1025, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:17:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1026, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:18:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1027, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:18:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1028, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:18:00' AS SmallDateTime), N'10547', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1029, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T13:18:00' AS SmallDateTime), N'10547', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1030, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:17:00' AS SmallDateTime), N'10398', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1031, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:22:00' AS SmallDateTime), N'18596', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1032, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:23:00' AS SmallDateTime), N'18596', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1033, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:24:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1034, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:25:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1035, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:26:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1036, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:26:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1037, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:26:00' AS SmallDateTime), N'8497', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1038, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1039, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1040, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1041, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1042, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1043, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1044, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1045, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1046, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1047, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1048, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1049, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1050, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1051, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1052, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1053, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1054, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1055, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:28:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1056, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:30:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1057, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:38:00' AS SmallDateTime), N'8198', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1058, 25, 49, N'DEBITO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:40:00' AS SmallDateTime), N'8146', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1059, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:41:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1060, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:41:00' AS SmallDateTime), N'2697', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1061, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:43:00' AS SmallDateTime), N'13397', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1062, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:43:00' AS SmallDateTime), N'13397', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1063, 25, 49, N'CREDITO', N'jjmadeo@gmail.com', N'asd', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T16:43:00' AS SmallDateTime), N'13397', 0)
GO
INSERT [dbo].[Ventas] ([id], [id_empl], [id_usua], [Medio_Pago], [nombreClie], [cuilClie], [DireccionClie], [fecha], [total], [id_sucursal]) VALUES (1064, 25, 49, N'EFECTIVO', N'jjmadeo@gmail.com', N'sad', N'Alberdi 1637 , Luis Guillon', CAST(N'2020-06-04T17:03:00' AS SmallDateTime), N'11197', 10)
GO
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
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
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 04/06/2020 18:38:17 ******/
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
