USE [master]
GO
/****** Object:  Database [LionsVentas]    Script Date: 28/03/2024 01:33:03 ******/
CREATE DATABASE [LionsVentas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LionsVentas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LionsVentas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LionsVentas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LionsVentas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LionsVentas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LionsVentas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LionsVentas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LionsVentas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LionsVentas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LionsVentas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LionsVentas] SET ARITHABORT OFF 
GO
ALTER DATABASE [LionsVentas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LionsVentas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LionsVentas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LionsVentas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LionsVentas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LionsVentas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LionsVentas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LionsVentas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LionsVentas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LionsVentas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LionsVentas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LionsVentas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LionsVentas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LionsVentas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LionsVentas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LionsVentas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LionsVentas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LionsVentas] SET RECOVERY FULL 
GO
ALTER DATABASE [LionsVentas] SET  MULTI_USER 
GO
ALTER DATABASE [LionsVentas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LionsVentas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LionsVentas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LionsVentas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LionsVentas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LionsVentas', N'ON'
GO
ALTER DATABASE [LionsVentas] SET QUERY_STORE = OFF
GO
USE [LionsVentas]
GO
/****** Object:  Table [dbo].[DISTRITO]    Script Date: 28/03/2024 01:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITO](
	[CODDIST] [int] IDENTITY(1,1) NOT NULL,
	[NOMDIST] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODDIST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[CODCLI] [int] IDENTITY(1,1) NOT NULL,
	[TIPCLI] [char](1) NULL,
	[RAZONSOCIAL] [varchar](40) NULL,
	[RUC] [char](11) NULL,
	[NOMBRE] [varchar](40) NULL,
	[AP_PAT] [varchar](40) NULL,
	[AP_MAT] [varchar](40) NULL,
	[SEXO] [char](1) NULL,
	[FNAC] [date] NULL,
	[DIRECCION] [varchar](40) NULL,
	[CORREO] [varchar](40) NULL,
	[TELEFONO] [varchar](7) NULL,
	[FREG] [date] NULL,
	[ESTADO] [char](1) NULL,
	[coddist] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CODCLI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerClientes]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VerClientes]
as
Select  CODCLI as codigo ,RAZONSOCIAL, NOMBRE, AP_PAT, AP_MAT, DIRECCION, d.NOMDIST as NombreDistrito 
		from CLIENTE c left join  DISTRITO d
on c.coddist = d.CODDIST
GO
/****** Object:  Table [dbo].[ALMACEN]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALMACEN](
	[CODALM] [int] IDENTITY(1,1) NOT NULL,
	[CODPROD] [int] NULL,
	[STOCK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CODALM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAB_COMPROBANTE]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAB_COMPROBANTE](
	[CODCABCOMPROBANTE] [int] IDENTITY(1,1) NOT NULL,
	[NSERIE] [varchar](4) NOT NULL,
	[CORRELATIVO] [varchar](6) NOT NULL,
	[FECHA] [date] NULL,
	[CODEMP] [int] NULL,
	[CODCLI] [int] NULL,
	[TIPOCOMP] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODCABCOMPROBANTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAB_COT]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAB_COT](
	[CODCABCOT] [int] IDENTITY(1,1) NOT NULL,
	[NSERIE] [varchar](4) NOT NULL,
	[CORRELATIVO] [varchar](6) NULL,
	[FREG] [date] NULL,
	[CODCLI] [int] NULL,
	[CODPROD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CODCABCOT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAB_ORDEN]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAB_ORDEN](
	[CODORDEN] [int] IDENTITY(1,1) NOT NULL,
	[NSERIE] [varchar](4) NULL,
	[CORRELATIVO] [varchar](6) NULL,
	[CODPROV] [int] NULL,
	[CODPROD] [int] NULL,
	[FREG] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CODORDEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[CODCAR] [int] IDENTITY(1,1) NOT NULL,
	[NOMCAR] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODCAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DET_COT]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DET_COT](
	[CODCABCOT] [int] NULL,
	[NSERIE] [varchar](4) NULL,
	[correlativo] [varchar](6) NULL,
	[CANT] [int] NULL,
	[PVENTA] [decimal](7, 2) NULL,
	[IGV] [decimal](7, 2) NULL,
	[TOTAL] [decimal](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DET_ORDEN]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DET_ORDEN](
	[CODORDEN] [int] NULL,
	[NROORDEN] [char](11) NULL,
	[CANT] [int] NULL,
	[PRECOMPRA] [decimal](7, 2) NULL,
	[IGV] [decimal](7, 2) NULL,
	[TOTAL] [decimal](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPROBANTE]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPROBANTE](
	[CODCABCOMPROBANTE] [int] NOT NULL,
	[NSERIE] [varchar](4) NULL,
	[CORRELATIVO] [varchar](6) NULL,
	[CANT] [int] NULL,
	[CODPROD] [int] NULL,
	[PREVENTA] [decimal](7, 2) NULL,
	[IGV] [decimal](7, 2) NULL,
	[DESCUENTO] [decimal](7, 2) NULL,
	[TOTAL] [decimal](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[CODEMP] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](40) NULL,
	[AP_PAT] [varchar](50) NULL,
	[AP_MAT] [varchar](50) NULL,
	[DNI] [char](8) NULL,
	[SEXO] [char](1) NULL,
	[DIRECCION] [varchar](50) NULL,
	[CORREO] [varchar](40) NULL,
	[TELEFONO] [varchar](7) NULL,
	[CELULAR] [char](9) NULL,
	[FREG] [date] NULL,
	[ESTADO] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODEMP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoxCargo]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoxCargo](
	[CodEmpXCargo] [int] IDENTITY(1,1) NOT NULL,
	[CodEmp] [int] NULL,
	[CodCar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errores]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[CodigoError] [int] NULL,
	[MensajeError] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[CODMAR] [int] IDENTITY(1,1) NOT NULL,
	[NOMMAR] [varchar](40) NULL,
	[estado] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODMAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[CODPROD] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](40) NULL,
	[DESCRIPCION] [varchar](70) NULL,
	[CODMAR] [int] NULL,
	[CODPROV] [int] NULL,
	[FREG] [date] NULL,
	[PVENTA] [decimal](7, 2) NULL,
	[PCOMPRA] [decimal](7, 2) NULL,
	[STOCKMIN] [int] NULL,
	[RutaImage] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODPROD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[CODPROV] [int] IDENTITY(1,1) NOT NULL,
	[RAZONSOCIAL] [varchar](40) NULL,
	[RUC] [char](11) NULL,
	[DIRECCION] [varchar](60) NULL,
	[CORREO] [varchar](40) NULL,
	[TELEFONO] [char](7) NULL,
	[CELULAR] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODPROV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[CODUSU] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](40) NULL,
	[CLAVE] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODUSU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([CODCLI], [TIPCLI], [RAZONSOCIAL], [RUC], [NOMBRE], [AP_PAT], [AP_MAT], [SEXO], [FNAC], [DIRECCION], [CORREO], [TELEFONO], [FREG], [ESTADO], [coddist]) VALUES (9, N'J', N'INDUSTRIA DE TEXTOS ESCOLARES', N'20555841080', N'', N'', N'', N'm', CAST(N'1990-09-26' AS Date), N'11111', N'correo@hotmail.com', N'4232324', CAST(N'2024-03-14' AS Date), N'A', 2)
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
SET IDENTITY_INSERT [dbo].[DISTRITO] ON 

INSERT [dbo].[DISTRITO] ([CODDIST], [NOMDIST]) VALUES (1, N'Chorrillos')
INSERT [dbo].[DISTRITO] ([CODDIST], [NOMDIST]) VALUES (2, N'San Juan lurigancho')
INSERT [dbo].[DISTRITO] ([CODDIST], [NOMDIST]) VALUES (3, N'Lince')
SET IDENTITY_INSERT [dbo].[DISTRITO] OFF
SET IDENTITY_INSERT [dbo].[MARCA] ON 

INSERT [dbo].[MARCA] ([CODMAR], [NOMMAR], [estado]) VALUES (1, N'AGE', N'A')
INSERT [dbo].[MARCA] ([CODMAR], [NOMMAR], [estado]) VALUES (2, N'ALIANZA', N'A')
INSERT [dbo].[MARCA] ([CODMAR], [NOMMAR], [estado]) VALUES (3, N'AGNESI', N'A')
INSERT [dbo].[MARCA] ([CODMAR], [NOMMAR], [estado]) VALUES (4, N'BARILLA', N'A')
INSERT [dbo].[MARCA] ([CODMAR], [NOMMAR], [estado]) VALUES (5, N'Hoja verde', N'A')
INSERT [dbo].[MARCA] ([CODMAR], [NOMMAR], [estado]) VALUES (6, N'test1', N'A')
SET IDENTITY_INSERT [dbo].[MARCA] OFF
INSERT [dbo].[Mesa] ([id], [nombre]) VALUES (1, N'Dispensador de vasos')
INSERT [dbo].[Mesa] ([id], [nombre]) VALUES (2, N'Repostero de cocina')
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (2, N'fideo spaghetti don vitttorio 950g', N'', 1, 1, CAST(N'2024-01-23' AS Date), CAST(7.40 AS Decimal(7, 2)), CAST(7.00 AS Decimal(7, 2)), 100, NULL)
INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (3, N'fideo don vitttorio Tornillo Bolsa 250g', N'', 1, 1, CAST(N'2024-01-23' AS Date), CAST(2.40 AS Decimal(7, 2)), CAST(2.00 AS Decimal(7, 2)), 100, NULL)
INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (5, N'fideo spaghetti Don vitttorio Bolsa 450g', N'', 2, 2, CAST(N'2024-01-23' AS Date), CAST(4.60 AS Decimal(7, 2)), CAST(4.00 AS Decimal(7, 2)), 100, NULL)
INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (6, N'Fideos Cabello de angel San Jorge 250g', N'', 2, 2, CAST(N'2024-01-23' AS Date), CAST(1.70 AS Decimal(7, 2)), CAST(1.00 AS Decimal(7, 2)), 100, NULL)
INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (8, N'Fideos Don Vittorio Canuto Bolsa 235g', N'', 2, 2, CAST(N'2024-01-23' AS Date), CAST(2.50 AS Decimal(7, 2)), CAST(2.00 AS Decimal(7, 2)), 100, NULL)
INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (9, N'Fideos Spaghetti Nicolini 950g', N'', 3, 3, CAST(N'2024-01-23' AS Date), CAST(2.50 AS Decimal(7, 2)), CAST(2.00 AS Decimal(7, 2)), 100, NULL)
INSERT [dbo].[PRODUCTO] ([CODPROD], [NOMBRE], [DESCRIPCION], [CODMAR], [CODPROV], [FREG], [PVENTA], [PCOMPRA], [STOCKMIN], [RutaImage]) VALUES (10, N'Fideos Bells Bolsa 1kg', N'', 3, 3, CAST(N'2024-01-23' AS Date), CAST(5.50 AS Decimal(7, 2)), CAST(5.00 AS Decimal(7, 2)), 100, NULL)
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
SET IDENTITY_INSERT [dbo].[PROVEEDOR] ON 

INSERT [dbo].[PROVEEDOR] ([CODPROV], [RAZONSOCIAL], [RUC], [DIRECCION], [CORREO], [TELEFONO], [CELULAR]) VALUES (1, N'MARCAS ALIADAS', N'20446631234', N'', N'', N'       ', N'         ')
INSERT [dbo].[PROVEEDOR] ([CODPROV], [RAZONSOCIAL], [RUC], [DIRECCION], [CORREO], [TELEFONO], [CELULAR]) VALUES (2, N'PLAZAVEA', N'20449259441', N'', N'', N'       ', N'         ')
INSERT [dbo].[PROVEEDOR] ([CODPROV], [RAZONSOCIAL], [RUC], [DIRECCION], [CORREO], [TELEFONO], [CELULAR]) VALUES (3, N'PROMART', N'20106824831', N'', N'', N'       ', N'         ')
SET IDENTITY_INSERT [dbo].[PROVEEDOR] OFF
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([CODUSU], [ID], [CLAVE]) VALUES (1, N'IVAN26', N'46631233')
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
/****** Object:  Index [PK_CodEmpxCargo]    Script Date: 28/03/2024 01:33:04 ******/
ALTER TABLE [dbo].[EmpleadoxCargo] ADD  CONSTRAINT [PK_CodEmpxCargo] PRIMARY KEY NONCLUSTERED 
(
	[CodEmpXCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALMACEN]  WITH CHECK ADD FOREIGN KEY([CODPROD])
REFERENCES [dbo].[PRODUCTO] ([CODPROD])
GO
ALTER TABLE [dbo].[CAB_COMPROBANTE]  WITH CHECK ADD FOREIGN KEY([CODCLI])
REFERENCES [dbo].[CLIENTE] ([CODCLI])
GO
ALTER TABLE [dbo].[CAB_COMPROBANTE]  WITH CHECK ADD FOREIGN KEY([CODEMP])
REFERENCES [dbo].[EMPLEADO] ([CODEMP])
GO
ALTER TABLE [dbo].[CAB_COT]  WITH CHECK ADD FOREIGN KEY([CODCLI])
REFERENCES [dbo].[CLIENTE] ([CODCLI])
GO
ALTER TABLE [dbo].[CAB_COT]  WITH CHECK ADD FOREIGN KEY([CODPROD])
REFERENCES [dbo].[PRODUCTO] ([CODPROD])
GO
ALTER TABLE [dbo].[CAB_ORDEN]  WITH CHECK ADD FOREIGN KEY([CODPROV])
REFERENCES [dbo].[PROVEEDOR] ([CODPROV])
GO
ALTER TABLE [dbo].[CAB_ORDEN]  WITH CHECK ADD FOREIGN KEY([CODPROD])
REFERENCES [dbo].[PRODUCTO] ([CODPROD])
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [fk_ClienteDistrito] FOREIGN KEY([coddist])
REFERENCES [dbo].[DISTRITO] ([CODDIST])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [fk_ClienteDistrito]
GO
ALTER TABLE [dbo].[DET_COT]  WITH CHECK ADD FOREIGN KEY([CODCABCOT])
REFERENCES [dbo].[CAB_COT] ([CODCABCOT])
GO
ALTER TABLE [dbo].[DET_ORDEN]  WITH CHECK ADD FOREIGN KEY([CODORDEN])
REFERENCES [dbo].[CAB_ORDEN] ([CODORDEN])
GO
ALTER TABLE [dbo].[DETALLE_COMPROBANTE]  WITH CHECK ADD FOREIGN KEY([CODCABCOMPROBANTE])
REFERENCES [dbo].[CAB_COMPROBANTE] ([CODCABCOMPROBANTE])
GO
ALTER TABLE [dbo].[DETALLE_COMPROBANTE]  WITH CHECK ADD FOREIGN KEY([CODPROD])
REFERENCES [dbo].[PRODUCTO] ([CODPROD])
GO
ALTER TABLE [dbo].[EmpleadoxCargo]  WITH CHECK ADD  CONSTRAINT [FK_CodCar] FOREIGN KEY([CodCar])
REFERENCES [dbo].[CARGO] ([CODCAR])
GO
ALTER TABLE [dbo].[EmpleadoxCargo] CHECK CONSTRAINT [FK_CodCar]
GO
ALTER TABLE [dbo].[EmpleadoxCargo]  WITH CHECK ADD  CONSTRAINT [FK_CodEmp] FOREIGN KEY([CodEmp])
REFERENCES [dbo].[EMPLEADO] ([CODEMP])
GO
ALTER TABLE [dbo].[EmpleadoxCargo] CHECK CONSTRAINT [FK_CodEmp]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([CODMAR])
REFERENCES [dbo].[MARCA] ([CODMAR])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([CODPROV])
REFERENCES [dbo].[PROVEEDOR] ([CODPROV])
GO
/****** Object:  StoredProcedure [dbo].[EjecutarProceso]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[EjecutarProceso]
as
begin
begin try
	select * from nuevatabla;
end try
begin catch
	select error_number() as ErrorNumber
	, error_message() as ErrorMessage;
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_marca]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Eliminar_marca](@codmar int)
as
begin
begin try
print 'try'
	delete  from MARCAs where CODMAR = @codmar
end try
begin catch
print 'catch'
	select ERROR_MESSAGE() , ERROR_SEVERITY()
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insertar_cliente]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insertar_cliente] ( @tipcli char(1),  @razonsocial varchar(40), @ruc char(11), 
								   @nombre varchar(40), @ap_pat varchar(40), @ap_mat varchar(40), 
								   @sexo char(1), @fnac date, @direccion varchar(40),@correo varchar(40),
								  @telefono varchar(7), @freg date, @estado char(1), 
								   @estadomensaje varchar(200) output  ,  @estadoflag int output)


as
Begin

	

		set @estadomensaje  = '';
		set @estadoflag = 0;


		insert into cliente ( tipcli ,  razonsocial , ruc , 
								   nombre , ap_pat , ap_mat , sexo , 
								   fnac , direccion , correo, telefono , freg , estado ) 
								   values ( @tipcli ,  @razonsocial , @ruc , 
								   @nombre , @ap_pat , @ap_mat , @sexo , @fnac , 
								   @direccion , @correo, @telefono , @freg , @estado ) ;
		set @estadomensaje = 'Insercion exitosa';
		set @estadoflag = 1;			
		print 'paso insercion'
		if @@ERROR <> 1
		Begin
			set @estadomensaje  = 'Error en la insercion ' 
			set @estadoflag = -1
		end
	
end
GO
/****** Object:  StoredProcedure [dbo].[Insertar_marca]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insertar_marca](@codmar int, @nommar varchar(40), @estado char(1) )
as
Begin
	Begin try
		insert into MARCA (NOMMAR, estado) values(@nommar, @estado)
		select 'insercion exitosa'
		print 'cumpleñeados es xtiosa'
	End try
	Begin Catch
		print 'ingreso al catch de jb'
		select ERROR_MESSAGE() , ERROR_SEVERITY()
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[InsertarMesa]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertarMesa]
(@id int, @nombre varchar(100))
as
 begin try
	insert into Mesa values (@id, @nombre);
	end try
	begin catch
		SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_MESSAGE() AS ErrorMessage;  
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee]
 @FirstName NVARCHAR(50),
 @LastName NVARCHAR(50)
AS
BEGIN
 BEGIN TRY
 --- Start of the TRY block
 
 --- Insert the employee into the Employees table
 INSERT INTO Employees (FirstName, LastName)
 VALUES (@FirstName, @LastName);
 
 --- End of the TRY block
 END TRY
 BEGIN CATCH
 
 
 --- Log the error or perform other error handling actions
 DECLARE @ErrorMessage NVARCHAR(4000);
 DECLARE @ErrorSeverity INT;
 DECLARE @ErrorState INT;

 set @ErrorMessage = ERROR_MESSAGE();
 set @ErrorSeverity = ERROR_SEVERITY();
 set @ErrorState = ERROR_STATE();
 select @ErrorMessage , @ErrorSeverity, @ErrorState
 --- You can log the error or perform other actions here
 --- For example: INSERT INTO ErrorLog (ErrorMessage, ErrorSeverity, ErrorState)
 --- VALUES (@ErrorMessage, @ErrorSeverity, @ErrorState);
 
 --- Rethrow the error to the client
 --RAISEERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
 
 --- End of the CATCH block
 END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[ListarCliente]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarCliente](@codigo int)
as
begin
	select * from VerClientes vc where vc.codigo = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[RestablecerIdIdentity]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RestablecerIdIdentity](@tabla varchar(200), @valorIdentity int)
	as
	Begin
	--DBCC checkident ('marca')
	--DBCC checkident ('Employees', reseed)
	--exec RestablecerIdIdentity 'marca', 5
		DBCC checkident (@tabla, reseed, @valorIdentity)
	End
GO
/****** Object:  StoredProcedure [dbo].[sp_listaTablas]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_listaTablas]
as
begin
select * from nuevatabla;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listaTablas2]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listaTablas2]
as
begin
select * from nuevatabla2;
if @@ERROR<> 0 
Begin
	select 'sucedio un error al eliminar tabla'
End
end
GO
/****** Object:  StoredProcedure [dbo].[Try_Catch_Demo]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Try_Catch_Demo]
As
BEGIN TRY
   DECLARE @x int
   SELECT @x = 1/0
   PRINT 'This statement will not be executed'
END TRY
BEGIN CATCH
    PRINT 'This is an error: ' + error_message()
    BEGIN TRY
       DECLARE @y int
       SELECT @y = 1/0
    END TRY
    BEGIN CATCH
       PRINT 'This is another error: ' + error_message()
    END CATCH
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_ExampleProc]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure that will cause an   
-- object resolution error.  
CREATE PROCEDURE [dbo].[usp_ExampleProc]  
AS  
    SELECT * FROM NonexistentTable;  
GO
/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 28/03/2024 01:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetErrorInfo]  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO
USE [master]
GO
ALTER DATABASE [LionsVentas] SET  READ_WRITE 
GO
