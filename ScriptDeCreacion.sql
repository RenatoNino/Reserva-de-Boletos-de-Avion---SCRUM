USE [master]
GO
/****** Object:  Database [ReservaVuelo]    Script Date: 02/11/2022 13:29:00 ******/
CREATE DATABASE [ReservaVuelo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservaVuelo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ReservaVuelo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservaVuelo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ReservaVuelo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ReservaVuelo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservaVuelo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReservaVuelo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReservaVuelo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReservaVuelo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReservaVuelo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReservaVuelo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReservaVuelo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReservaVuelo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReservaVuelo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReservaVuelo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReservaVuelo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReservaVuelo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReservaVuelo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReservaVuelo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReservaVuelo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReservaVuelo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReservaVuelo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReservaVuelo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReservaVuelo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReservaVuelo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReservaVuelo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReservaVuelo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReservaVuelo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReservaVuelo] SET RECOVERY FULL 
GO
ALTER DATABASE [ReservaVuelo] SET  MULTI_USER 
GO
ALTER DATABASE [ReservaVuelo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReservaVuelo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReservaVuelo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReservaVuelo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReservaVuelo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReservaVuelo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ReservaVuelo', N'ON'
GO
ALTER DATABASE [ReservaVuelo] SET QUERY_STORE = OFF
GO
USE [ReservaVuelo]
GO
/****** Object:  Table [dbo].[Aerolinea]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aerolinea](
	[idAerolinea] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Aerolinea] PRIMARY KEY CLUSTERED 
(
	[idAerolinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aeropuerto]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aeropuerto](
	[idAeropuerto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[idPais] [int] NOT NULL,
 CONSTRAINT [PK_Aeropuerto] PRIMARY KEY CLUSTERED 
(
	[idAeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asiento](
	[idAsiento] [int] IDENTITY(1,1) NOT NULL,
	[idAvion] [int] NOT NULL,
	[Fila] [int] NOT NULL,
	[Letra] [char](1) NOT NULL,
	[idClase] [int] NOT NULL,
 CONSTRAINT [PK_Asiento] PRIMARY KEY CLUSTERED 
(
	[idAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditoriasPagos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriasPagos](
	[idAuditoriaPago] [int] IDENTITY(1,1) NOT NULL,
	[idTrabajador] [int] NOT NULL,
	[idPago] [int] NOT NULL,
 CONSTRAINT [PK_AuditoriasPagos] PRIMARY KEY CLUSTERED 
(
	[idAuditoriaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avion]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[idAvion] [int] IDENTITY(1,1) NOT NULL,
	[idAerolinea] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Avion] PRIMARY KEY CLUSTERED 
(
	[idAvion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CajaChica]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CajaChica](
	[idCajaChica] [int] IDENTITY(1,1) NOT NULL,
	[idTrabajador] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_CajaChica] PRIMARY KEY CLUSTERED 
(
	[idCajaChica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CambiosRegistrados]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CambiosRegistrados](
	[idCambioRegistrado] [int] IDENTITY(1,1) NOT NULL,
	[idTrabajador] [int] NOT NULL,
	[Operacion] [varchar](20) NOT NULL,
	[Tabla] [varchar](20) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[idRegistro] [int] NOT NULL,
 CONSTRAINT [PK_CambiosRegistrados] PRIMARY KEY CLUSTERED 
(
	[idCambioRegistrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clase]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clase](
	[idClase] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Clase] PRIMARY KEY CLUSTERED 
(
	[idClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePago](
	[idDetallePago] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[idTipoPago] [int] NOT NULL,
	[numTipoPago] [varchar](10) NOT NULL,
	[PorcIGV] [int] NOT NULL,
	[NumeroDocumento] [varchar](15) NULL,
 CONSTRAINT [PK_DetallePago] PRIMARY KEY CLUSTERED 
(
	[idDetallePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
	[idDetallePago] [int] NOT NULL,
	[Vigente] [bit] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[idPasajero] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[Pasaporte] [nchar](9) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[idPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[PrimerApellido] [varchar](20) NOT NULL,
	[SegundoApellido] [varchar](20) NULL,
	[idPais] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numDocumento] [varchar](15) NOT NULL,
	[Edad] [int] NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](30) NULL,
	[CodigoPostal] [char](5) NULL,
	[Correo] [varchar](50) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[idVuelo] [int] NOT NULL,
	[idTipoEquipaje] [int] NOT NULL,
	[idPago] [int] NOT NULL,
	[idPasajero] [int] NOT NULL,
	[idAsiento] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifa]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa](
	[idTarifa] [int] IDENTITY(1,1) NOT NULL,
	[idClase] [int] NOT NULL,
	[idVuelo] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Tarifa] PRIMARY KEY CLUSTERED 
(
	[idTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[idTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEquipaje]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEquipaje](
	[idTipoEquipaje] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_TipoEquipaje] PRIMARY KEY CLUSTERED 
(
	[idTipoEquipaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajador](
	[idTrabajador] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[Nickname] [varchar](20) NOT NULL,
	[Contraseña] [varchar](20) NOT NULL,
	[idRol] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[idTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[idVuelo] [int] IDENTITY(1,1) NOT NULL,
	[idAvion] [int] NOT NULL,
	[idAirportSalida] [int] NOT NULL,
	[idAirportLlegada] [int] NOT NULL,
	[FechaHoraSalida] [datetime] NOT NULL,
	[FechaHoraLlegada] [datetime] NOT NULL,
 CONSTRAINT [PK_Vuelo] PRIMARY KEY CLUSTERED 
(
	[idVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aerolinea] ON 

INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (1, N'Peruvian Airlines')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (2, N'Avianca')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (3, N'LATAM Airlines')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (4, N'SKY Airlines')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (5, N'Ulendo Airlink')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (6, N'Copa Airlines')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (7, N'Air Europa')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (8, N'United Airlines')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (9, N'ANDES Líneas Aéreas')
INSERT [dbo].[Aerolinea] ([idAerolinea], [Nombre]) VALUES (10, N'LATAM Brasil')
SET IDENTITY_INSERT [dbo].[Aerolinea] OFF
GO
SET IDENTITY_INSERT [dbo].[Aeropuerto] ON 

INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (1, N'Aeropuerto Jorge Chavez', N'Lima', 1)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (2, N'Aeropuerto Adolfo Suárez', N'Madrid - Barajas', 2)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (68, N'Aeropuerto Internacional José Maria Cordova', N'Medellín', 13)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (69, N'Aeropuerto Internacional de Tijuana', N'Tijuana', 14)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (70, N'Aeropuerto Internacional Luis Muñoz Marón', N'San Juan', 11)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (71, N'Aeropuerto Internacional de Tocumen', N'Ciudad de Panamá', 15)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (72, N'Aeropuerto Internacional El Dorado', N'Bogotá', 13)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (73, N'Aeropuerto Internacional del Golfo', N'Madrid', 2)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (74, N'Aeropuerto Internacional Ivan Iman', N'Piura', 16)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (75, N'Aeropuerto Internacional Konichiwa', N'Tokyo', 10)
INSERT [dbo].[Aeropuerto] ([idAeropuerto], [Nombre], [Ciudad], [idPais]) VALUES (76, N'Aeropuerto Popula de China', N'Shangai', 6)
SET IDENTITY_INSERT [dbo].[Aeropuerto] OFF
GO
SET IDENTITY_INSERT [dbo].[Asiento] ON 

INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (1, 1, 12, N'J', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (2, 1, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (3, 1, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (4, 1, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (5, 1, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (6, 1, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (7, 1, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (8, 1, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (9, 1, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (10, 1, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (11, 1, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (12, 1, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (13, 1, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (14, 1, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (15, 1, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (16, 1, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (17, 1, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (18, 1, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (19, 1, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (20, 1, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (21, 1, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (22, 2, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (23, 2, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (24, 2, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (25, 2, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (26, 2, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (27, 2, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (28, 2, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (29, 2, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (30, 2, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (31, 2, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (32, 2, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (33, 2, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (34, 2, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (35, 2, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (36, 2, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (37, 2, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (38, 2, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (39, 2, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (40, 2, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (41, 2, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (42, 3, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (43, 3, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (44, 3, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (45, 3, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (46, 3, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (47, 3, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (48, 3, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (49, 3, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (50, 3, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (51, 3, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (52, 3, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (53, 3, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (54, 3, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (55, 3, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (56, 3, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (57, 3, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (58, 3, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (59, 3, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (60, 3, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (61, 3, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (62, 4, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (63, 4, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (64, 4, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (65, 4, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (66, 4, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (67, 4, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (68, 4, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (69, 4, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (70, 4, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (71, 4, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (72, 4, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (73, 4, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (74, 4, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (75, 4, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (76, 4, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (77, 4, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (78, 4, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (79, 4, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (80, 4, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (81, 4, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (82, 5, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (83, 5, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (84, 5, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (85, 5, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (86, 5, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (87, 5, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (88, 5, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (89, 5, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (90, 5, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (91, 5, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (92, 5, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (93, 5, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (94, 5, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (95, 5, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (96, 5, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (97, 5, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (98, 5, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (99, 5, 4, N'R', 4)
GO
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (100, 5, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (101, 5, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (102, 6, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (103, 6, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (104, 6, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (105, 6, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (106, 6, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (107, 6, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (108, 6, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (109, 6, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (110, 6, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (111, 6, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (112, 6, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (113, 6, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (114, 6, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (115, 6, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (116, 6, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (117, 6, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (118, 6, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (119, 6, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (120, 6, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (121, 6, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (122, 7, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (123, 7, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (124, 7, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (125, 7, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (126, 7, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (127, 7, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (128, 7, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (129, 7, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (130, 7, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (131, 7, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (132, 7, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (133, 7, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (134, 7, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (135, 7, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (136, 7, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (137, 7, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (138, 7, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (139, 7, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (140, 7, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (141, 7, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (142, 9, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (143, 9, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (144, 9, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (145, 9, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (146, 9, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (147, 9, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (148, 9, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (149, 9, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (150, 9, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (151, 9, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (152, 9, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (153, 9, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (154, 9, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (155, 9, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (156, 9, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (157, 9, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (158, 9, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (159, 9, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (160, 9, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (161, 9, 4, N'T', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (162, 10, 1, N'A', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (163, 10, 1, N'B', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (164, 10, 1, N'C', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (165, 10, 1, N'D', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (166, 10, 1, N'E', 1)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (167, 10, 2, N'F', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (168, 10, 2, N'G', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (169, 10, 2, N'H', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (170, 10, 2, N'I', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (171, 10, 2, N'J', 2)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (172, 10, 3, N'K', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (173, 10, 3, N'L', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (174, 10, 3, N'M', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (175, 10, 3, N'N', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (176, 10, 3, N'O', 3)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (177, 10, 4, N'P', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (178, 5, 4, N'Q', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (179, 10, 4, N'R', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (180, 10, 4, N'S', 4)
INSERT [dbo].[Asiento] ([idAsiento], [idAvion], [Fila], [Letra], [idClase]) VALUES (181, 10, 4, N'T', 4)
SET IDENTITY_INSERT [dbo].[Asiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Avion] ON 

INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (1, 1, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (2, 2, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (3, 3, 0)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (4, 2, 0)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (5, 4, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (6, 1, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (7, 3, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (9, 2, 0)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (10, 3, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (12, 2, 0)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (13, 5, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (14, 6, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (15, 7, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (16, 8, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (17, 9, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (18, 10, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (19, 5, 1)
INSERT [dbo].[Avion] ([idAvion], [idAerolinea], [Activo]) VALUES (20, 6, 1)
SET IDENTITY_INSERT [dbo].[Avion] OFF
GO
SET IDENTITY_INSERT [dbo].[CambiosRegistrados] ON 

INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1, 1, N'UPDATE', N'Pasajero', CAST(N'2022-09-23T00:59:50.000' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (2, 1, N'UPDATE', N'Aerolinea', CAST(N'2022-09-23T14:31:41.757' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (3, 1, N'UPDATE', N'Aerolinea', CAST(N'2022-09-23T14:37:54.717' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (4, 1, N'INSERT', N'Aerolinea', CAST(N'2022-09-23T14:38:15.860' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (5, 1, N'UPDATE', N'Aerolinea', CAST(N'2022-09-23T14:38:41.900' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (6, 1, N'UPDATE', N'Aerolinea', CAST(N'2022-09-23T14:39:03.470' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (7, 1, N'UPDATE', N'Aerolinea', CAST(N'2022-09-23T14:39:19.723' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (8, 1, N'DELETE', N'Aerolinea', CAST(N'2022-09-23T15:14:00.997' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (9, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:08:39.987' AS DateTime), 2)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (10, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:08:53.603' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (11, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:10:19.977' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (12, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:12:49.217' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (13, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:14:13.217' AS DateTime), 6)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (14, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:14:51.793' AS DateTime), 7)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (15, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T18:19:34.630' AS DateTime), 8)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (16, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T20:33:44.693' AS DateTime), 9)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (17, 1, N'UPDATE', N'Avion', CAST(N'2022-09-23T21:34:51.153' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (18, 1, N'INSERT', N'Avion', CAST(N'2022-09-23T21:48:33.123' AS DateTime), 10)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (19, 1, N'UPDATE', N'Avion', CAST(N'2022-09-23T21:48:49.660' AS DateTime), 10)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (20, 1, N'DELETE', N'Avion', CAST(N'2022-09-23T21:50:38.950' AS DateTime), 10)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (21, 1, N'UPDATE', N'Avion', CAST(N'2022-09-23T22:35:08.850' AS DateTime), 8)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (22, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T11:16:16.810' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (23, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T11:19:20.990' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (24, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T11:20:26.693' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (25, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T11:26:57.077' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (26, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T11:29:48.613' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (27, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-24T11:44:07.167' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (28, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-24T11:44:15.097' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (29, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-24T11:44:54.467' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (30, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-24T11:45:03.707' AS DateTime), 2)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (31, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T16:30:57.010' AS DateTime), 2)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (32, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T16:36:51.617' AS DateTime), 2)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (33, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T16:37:00.173' AS DateTime), 2)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (34, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T16:39:07.500' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (35, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-24T16:39:21.623' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (36, 1, N'UPDATE', N'Avion', CAST(N'2022-09-24T17:14:11.460' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (37, 1, N'INSERT', N'Avion', CAST(N'2022-09-24T17:15:04.797' AS DateTime), 10)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (38, 1, N'UPDATE', N'Avion', CAST(N'2022-09-24T17:15:24.547' AS DateTime), 10)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (39, 1, N'DELETE', N'Avion', CAST(N'2022-09-24T17:19:20.643' AS DateTime), 8)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (40, 1, N'INSERT', N'Avion', CAST(N'2022-09-24T17:21:27.537' AS DateTime), 11)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (41, 1, N'DELETE', N'Avion', CAST(N'2022-09-24T17:21:38.307' AS DateTime), 11)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (42, 1, N'UPDATE', N'Avion', CAST(N'2022-09-24T17:21:45.717' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (43, 1, N'INSERT', N'Avion', CAST(N'2022-09-24T17:21:52.997' AS DateTime), 12)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (44, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T17:23:50.367' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (45, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T17:23:58.690' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (46, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-24T17:24:04.767' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (47, 1, N'UPDATE', N'Aerolinea', CAST(N'2022-09-24T17:24:14.130' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (48, 1, N'INSERT', N'Aerolinea', CAST(N'2022-09-24T17:24:21.960' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (49, 1, N'DELETE', N'Aerolinea', CAST(N'2022-09-24T17:24:25.220' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (50, 1, N'INSERT', N'Clase', CAST(N'2022-09-24T18:00:47.410' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (51, 1, N'DELETE', N'Clase', CAST(N'2022-09-24T18:02:46.383' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (52, 1, N'INSERT', N'Clase', CAST(N'2022-09-24T18:03:06.513' AS DateTime), 6)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (53, 1, N'DELETE', N'Clase', CAST(N'2022-09-24T18:03:11.620' AS DateTime), 6)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (54, 1, N'INSERT', N'Rol', CAST(N'2022-09-24T18:15:44.797' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (55, 1, N'DELETE', N'Rol', CAST(N'2022-09-24T18:16:04.273' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (56, 1, N'INSERT', N'TipoDocumento', CAST(N'2022-09-24T18:28:38.667' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (57, 1, N'DELETE', N'TipoDocumento', CAST(N'2022-09-24T18:29:03.577' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (58, 1, N'INSERT', N'Turno', CAST(N'2022-09-24T18:48:03.993' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (59, 1, N'DELETE', N'Turno', CAST(N'2022-09-24T18:48:08.230' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (60, 1, N'INSERT', N'TipoPago', CAST(N'2022-09-24T18:58:14.780' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (61, 1, N'DELETE', N'TipoPago', CAST(N'2022-09-24T18:58:24.367' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (62, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:11:37.983' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (63, 1, N'DELETE', N'Pais', CAST(N'2022-09-24T19:11:41.990' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (64, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:12:37.173' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (65, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:12:45.090' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (66, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:12:51.917' AS DateTime), 6)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (67, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:13:13.437' AS DateTime), 7)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (68, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:13:21.477' AS DateTime), 8)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (69, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:13:28.530' AS DateTime), 9)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (70, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:13:34.170' AS DateTime), 10)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (71, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:13:44.090' AS DateTime), 11)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (72, 1, N'INSERT', N'Pais', CAST(N'2022-09-24T19:13:54.033' AS DateTime), 12)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (73, 1, N'INSERT', N'TipoEquipaje', CAST(N'2022-09-24T19:47:41.603' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (74, 1, N'INSERT', N'TipoEquipaje', CAST(N'2022-09-24T19:52:26.653' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (75, 1, N'UPDATE', N'TipoEquipaje', CAST(N'2022-09-24T20:09:18.427' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (76, 1, N'DELETE', N'TipoEquipaje', CAST(N'2022-09-24T20:15:14.237' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (77, 1, N'DELETE', N'TipoEquipaje', CAST(N'2022-09-24T20:15:17.587' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (78, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T21:46:25.767' AS DateTime), 0)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (79, 1, N'UPDATE', N'Aeropuerto', CAST(N'2022-09-24T21:47:00.167' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (80, 1, N'INSERT', N'Aeropuerto', CAST(N'2022-09-24T22:22:30.090' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (81, 1, N'DELETE', N'Aeropuerto', CAST(N'2022-09-26T04:30:04.277' AS DateTime), 3)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (82, 1, N'DELETE', N'Vuelo', CAST(N'2022-09-26T05:19:27.713' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (83, 1, N'INSERT', N'Pasajero', CAST(N'2022-09-26T15:07:11.383' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (84, 1, N'INSERT', N'Persona', CAST(N'2022-09-26T15:07:11.387' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (85, 1, N'INSERT', N'Tarifa', CAST(N'2022-09-27T01:24:47.040' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (86, 1, N'INSERT', N'Tarifa', CAST(N'2022-09-27T01:26:16.600' AS DateTime), 1)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (87, 1, N'INSERT', N'Tarifa', CAST(N'2022-09-27T01:35:24.013' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (88, 1, N'INSERT', N'Tarifa', CAST(N'2022-09-27T18:38:53.780' AS DateTime), 5)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (89, 1, N'INSERT', N'Tarifa', CAST(N'2022-09-27T18:39:11.090' AS DateTime), 6)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (90, 1, N'INSERT', N'DetallePago', CAST(N'2022-09-27T18:40:20.550' AS DateTime), 19)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (91, 1, N'INSERT', N'Pago', CAST(N'2022-09-27T18:40:20.570' AS DateTime), 8)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (92, 1, N'INSERT', N'Reserva', CAST(N'2022-09-27T18:40:20.617' AS DateTime), 4)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1088, 1, N'INSERT', N'DetallePago', CAST(N'2022-09-28T10:00:40.713' AS DateTime), 1018)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1089, 1, N'INSERT', N'Pago', CAST(N'2022-09-28T10:00:40.803' AS DateTime), 1006)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1090, 1, N'INSERT', N'Reserva', CAST(N'2022-09-28T10:00:40.813' AS DateTime), 1003)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1091, 1, N'INSERT', N'DetallePago', CAST(N'2022-09-28T14:02:07.713' AS DateTime), 1019)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1092, 1, N'INSERT', N'Pago', CAST(N'2022-09-28T14:02:07.720' AS DateTime), 1007)
INSERT [dbo].[CambiosRegistrados] ([idCambioRegistrado], [idTrabajador], [Operacion], [Tabla], [FechaHora], [idRegistro]) VALUES (1093, 1, N'INSERT', N'Reserva', CAST(N'2022-09-28T14:02:07.733' AS DateTime), 1004)
SET IDENTITY_INSERT [dbo].[CambiosRegistrados] OFF
GO
SET IDENTITY_INSERT [dbo].[Clase] ON 

INSERT [dbo].[Clase] ([idClase], [Nombre]) VALUES (1, N'Primera clase')
INSERT [dbo].[Clase] ([idClase], [Nombre]) VALUES (2, N'Clase ejecutiva')
INSERT [dbo].[Clase] ([idClase], [Nombre]) VALUES (3, N'Clase premium')
INSERT [dbo].[Clase] ([idClase], [Nombre]) VALUES (4, N'Clase turista')
SET IDENTITY_INSERT [dbo].[Clase] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallePago] ON 

INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (1, N'Renato Niño', N'Santa Julia 700', 1, N'1', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (2, N'asfa', N'sdgs', 1, N'2', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (3, N'asfa', N'sdgs', 1, N'3', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (4, N'Pablo Ramirez', N'Santa Rosa 150', 1, N'4', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (5, N'Pablo Ramirez', N'Santa Rosa 150', 1, N'5', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (6, N'Pablo Ramirez', N'Santa Rosa 150', 1, N'6', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (7, N'Renato Niño', N'Santa Julia 700', 1, N'7', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (8, N'Pablo Ramirez', N'Santa Rosa 150', 1, N'8', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (9, N'Renato Niño', N'Santa Julia 700', 1, N'9', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (10, N'Renato Niño', N'Santa Julia 700', 1, N'10', 18, N'72248201')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (11, N'Pablo Ramirez', N'Santa Rosa 150', 1, N'11', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (12, N'Renato Niño', N'Santa Julia 700', 1, N'12', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (13, N'Renato Niño', N'Santa Julia 700', 1, N'13', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (14, N'Renato Niño', N'Santa Julia 700', 2, N'1', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (15, N'Renato Niño', N'Santa Julia 700', 2, N'2', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (16, N'Renato Niño', N'Santa Julia 700', 1, N'14', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (17, N'Renato Niño', N'Santa Julia 700', 1, N'15', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (18, N'Pepito', N'asfasf', 1, N'16', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (19, N'Peter Romario Gonzales', N'Santa Rosa 491,Paita', 2, N'3', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (1018, N'TRUPAL SAC', N'Av. Panamericana 15896', 2, N'4', 18, N'73017288')
INSERT [dbo].[DetallePago] ([idDetallePago], [Nombre], [Direccion], [idTipoPago], [numTipoPago], [PorcIGV], [NumeroDocumento]) VALUES (1019, N'EEUU', N'WASHINGTONG DC', 2, N'5', 18, N'50505050')
SET IDENTITY_INSERT [dbo].[DetallePago] OFF
GO
SET IDENTITY_INSERT [dbo].[Pago] ON 

INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (1, CAST(N'2022-09-26' AS Date), 500.0000, 1, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (2, CAST(N'2022-09-27' AS Date), 800.0000, 14, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (3, CAST(N'2022-09-27' AS Date), 700.0000, 15, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (4, CAST(N'2022-09-27' AS Date), 750.0000, 16, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (5, CAST(N'2022-09-27' AS Date), 600.0000, 17, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (6, CAST(N'2022-09-28' AS Date), 800.0000, 1, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (7, CAST(N'2022-09-27' AS Date), 500.0000, 18, 0)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (8, CAST(N'2022-09-27' AS Date), 600.0000, 19, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (1006, CAST(N'2022-09-28' AS Date), 850.0000, 1018, 1)
INSERT [dbo].[Pago] ([idPago], [Fecha], [Monto], [idDetallePago], [Vigente]) VALUES (1007, CAST(N'2022-09-28' AS Date), 350.0000, 1019, 1)
SET IDENTITY_INSERT [dbo].[Pago] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (1, N'Perú')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (2, N'España')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (4, N'Estados Unidos')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (5, N'Rusia')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (6, N'China')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (7, N'Alemania')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (8, N'Reino Unido')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (9, N'Francia')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (10, N'Japón')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (11, N'Israel')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (12, N'Arabia Saudí')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (13, N'Colombia')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (14, N'México')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (15, N'Panamá')
INSERT [dbo].[Pais] ([idPais], [Nombre]) VALUES (16, N'Peru')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Pasajero] ON 

INSERT [dbo].[Pasajero] ([idPasajero], [idPersona], [Pasaporte], [Estado]) VALUES (3, 2, N'455656999', 1)
INSERT [dbo].[Pasajero] ([idPasajero], [idPersona], [Pasaporte], [Estado]) VALUES (4, 3, N'         ', 1)
SET IDENTITY_INSERT [dbo].[Pasajero] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [Nombre], [PrimerApellido], [SegundoApellido], [idPais], [idTipoDocumento], [numDocumento], [Edad], [Direccion], [Ciudad], [CodigoPostal], [Correo]) VALUES (1, N'Jorge Renato', N'Niño', N'Palacios', 1, 1, N'72248201', 21, N'Calle Santa Julia 700', N'Sullana', NULL, N'jorgenino07@gmail.com')
INSERT [dbo].[Persona] ([idPersona], [Nombre], [PrimerApellido], [SegundoApellido], [idPais], [idTipoDocumento], [numDocumento], [Edad], [Direccion], [Ciudad], [CodigoPostal], [Correo]) VALUES (2, N'Pool Alexander', N'Feria', N'Orozco', 1, 1, N'73017288', 20, NULL, N'Piura', NULL, N'')
INSERT [dbo].[Persona] ([idPersona], [Nombre], [PrimerApellido], [SegundoApellido], [idPais], [idTipoDocumento], [numDocumento], [Edad], [Direccion], [Ciudad], [CodigoPostal], [Correo]) VALUES (3, N'Paul', N'Castro', N'Jimenez', 2, 2, N'78596847', 25, N'', N'', N'     ', N'')
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([idReserva], [idVuelo], [idTipoEquipaje], [idPago], [idPasajero], [idAsiento], [FechaHora]) VALUES (1, 1, 1, 1, 3, 90, CAST(N'2022-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Reserva] ([idReserva], [idVuelo], [idTipoEquipaje], [idPago], [idPasajero], [idAsiento], [FechaHora]) VALUES (2, 1, 1, 5, 4, 85, CAST(N'2022-09-27T03:39:34.203' AS DateTime))
INSERT [dbo].[Reserva] ([idReserva], [idVuelo], [idTipoEquipaje], [idPago], [idPasajero], [idAsiento], [FechaHora]) VALUES (4, 1, 2, 8, 4, 92, CAST(N'2022-09-27T18:40:20.613' AS DateTime))
INSERT [dbo].[Reserva] ([idReserva], [idVuelo], [idTipoEquipaje], [idPago], [idPasajero], [idAsiento], [FechaHora]) VALUES (1003, 1, 3, 1006, 3, 84, CAST(N'2022-09-28T10:00:40.810' AS DateTime))
INSERT [dbo].[Reserva] ([idReserva], [idVuelo], [idTipoEquipaje], [idPago], [idPasajero], [idAsiento], [FechaHora]) VALUES (1004, 1, 1, 1007, 4, 100, CAST(N'2022-09-28T14:02:07.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [Nombre]) VALUES (1, N'Recepcionista')
INSERT [dbo].[Rol] ([idRol], [Nombre]) VALUES (2, N'Administrador')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarifa] ON 

INSERT [dbo].[Tarifa] ([idTarifa], [idClase], [idVuelo], [Precio], [Estado]) VALUES (1, 1, 1, 500.0000, 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idClase], [idVuelo], [Precio], [Estado]) VALUES (4, 2, 1, 400.0000, 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idClase], [idVuelo], [Precio], [Estado]) VALUES (5, 3, 1, 300.0000, 1)
INSERT [dbo].[Tarifa] ([idTarifa], [idClase], [idVuelo], [Precio], [Estado]) VALUES (6, 4, 1, 250.0000, 1)
SET IDENTITY_INSERT [dbo].[Tarifa] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 

INSERT [dbo].[TipoDocumento] ([idTipoDocumento], [Nombre]) VALUES (1, N'DNI       ')
INSERT [dbo].[TipoDocumento] ([idTipoDocumento], [Nombre]) VALUES (2, N'C.E.      ')
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoEquipaje] ON 

INSERT [dbo].[TipoEquipaje] ([idTipoEquipaje], [Descripcion], [Precio]) VALUES (1, N'Bolso + 10kg', 100.0000)
INSERT [dbo].[TipoEquipaje] ([idTipoEquipaje], [Descripcion], [Precio]) VALUES (2, N'Bolso + 23kg', 300.0000)
INSERT [dbo].[TipoEquipaje] ([idTipoEquipaje], [Descripcion], [Precio]) VALUES (3, N'Bolso + 10kg + 23kg', 350.0000)
SET IDENTITY_INSERT [dbo].[TipoEquipaje] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoPago] ON 

INSERT [dbo].[TipoPago] ([idTipoPago], [Nombre]) VALUES (1, N'Boleta')
INSERT [dbo].[TipoPago] ([idTipoPago], [Nombre]) VALUES (2, N'Factura')
SET IDENTITY_INSERT [dbo].[TipoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Trabajador] ON 

INSERT [dbo].[Trabajador] ([idTrabajador], [idPersona], [Nickname], [Contraseña], [idRol], [Estado]) VALUES (1, 1, N'Renato', N'123456', 2, 1)
INSERT [dbo].[Trabajador] ([idTrabajador], [idPersona], [Nickname], [Contraseña], [idRol], [Estado]) VALUES (2, 2, N'Pool', N'123456', 1, 1)
SET IDENTITY_INSERT [dbo].[Trabajador] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([idTurno], [Nombre]) VALUES (1, N'Mañana')
INSERT [dbo].[Turno] ([idTurno], [Nombre]) VALUES (2, N'Tarde')
INSERT [dbo].[Turno] ([idTurno], [Nombre]) VALUES (3, N'Noche')
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelo] ON 

INSERT [dbo].[Vuelo] ([idVuelo], [idAvion], [idAirportSalida], [idAirportLlegada], [FechaHoraSalida], [FechaHoraLlegada]) VALUES (1, 5, 1, 2, CAST(N'2022-09-26T00:00:00.000' AS DateTime), CAST(N'2022-09-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vuelo] OFF
GO
ALTER TABLE [dbo].[Pago] ADD  DEFAULT ((1)) FOR [Vigente]
GO
ALTER TABLE [dbo].[Pasajero] ADD  DEFAULT ('') FOR [Pasaporte]
GO
ALTER TABLE [dbo].[Pasajero] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ('') FOR [SegundoApellido]
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ('') FOR [Direccion]
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ('') FOR [Ciudad]
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ('') FOR [CodigoPostal]
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ('') FOR [Correo]
GO
ALTER TABLE [dbo].[Tarifa] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Trabajador] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Aeropuerto]  WITH CHECK ADD  CONSTRAINT [FK_Aeropuerto_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Aeropuerto] CHECK CONSTRAINT [FK_Aeropuerto_Pais]
GO
ALTER TABLE [dbo].[Asiento]  WITH CHECK ADD  CONSTRAINT [FK_Asiento_Avion] FOREIGN KEY([idAvion])
REFERENCES [dbo].[Avion] ([idAvion])
GO
ALTER TABLE [dbo].[Asiento] CHECK CONSTRAINT [FK_Asiento_Avion]
GO
ALTER TABLE [dbo].[Asiento]  WITH CHECK ADD  CONSTRAINT [FK_Asiento_Clase] FOREIGN KEY([idClase])
REFERENCES [dbo].[Clase] ([idClase])
GO
ALTER TABLE [dbo].[Asiento] CHECK CONSTRAINT [FK_Asiento_Clase]
GO
ALTER TABLE [dbo].[AuditoriasPagos]  WITH CHECK ADD  CONSTRAINT [FK_AuditoriasPagos_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[AuditoriasPagos] CHECK CONSTRAINT [FK_AuditoriasPagos_Pago]
GO
ALTER TABLE [dbo].[AuditoriasPagos]  WITH CHECK ADD  CONSTRAINT [FK_AuditoriasPagos_Trabajador] FOREIGN KEY([idTrabajador])
REFERENCES [dbo].[Trabajador] ([idTrabajador])
GO
ALTER TABLE [dbo].[AuditoriasPagos] CHECK CONSTRAINT [FK_AuditoriasPagos_Trabajador]
GO
ALTER TABLE [dbo].[Avion]  WITH CHECK ADD  CONSTRAINT [FK_Avion_Aerolinea] FOREIGN KEY([idAerolinea])
REFERENCES [dbo].[Aerolinea] ([idAerolinea])
GO
ALTER TABLE [dbo].[Avion] CHECK CONSTRAINT [FK_Avion_Aerolinea]
GO
ALTER TABLE [dbo].[CajaChica]  WITH CHECK ADD  CONSTRAINT [FK_CajaChica_Trabajador] FOREIGN KEY([idTrabajador])
REFERENCES [dbo].[Trabajador] ([idTrabajador])
GO
ALTER TABLE [dbo].[CajaChica] CHECK CONSTRAINT [FK_CajaChica_Trabajador]
GO
ALTER TABLE [dbo].[CajaChica]  WITH CHECK ADD  CONSTRAINT [FK_CajaChica_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[CajaChica] CHECK CONSTRAINT [FK_CajaChica_Turno]
GO
ALTER TABLE [dbo].[CambiosRegistrados]  WITH CHECK ADD  CONSTRAINT [FK_CambiosRegistrados_Trabajador] FOREIGN KEY([idTrabajador])
REFERENCES [dbo].[Trabajador] ([idTrabajador])
GO
ALTER TABLE [dbo].[CambiosRegistrados] CHECK CONSTRAINT [FK_CambiosRegistrados_Trabajador]
GO
ALTER TABLE [dbo].[DetallePago]  WITH CHECK ADD  CONSTRAINT [FK_DetallePago_TipoPago] FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[DetallePago] CHECK CONSTRAINT [FK_DetallePago_TipoPago]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_DetallePago] FOREIGN KEY([idDetallePago])
REFERENCES [dbo].[DetallePago] ([idDetallePago])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_DetallePago]
GO
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_Persona]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Pais]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoDocumento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoDocumento]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Asiento] FOREIGN KEY([idAsiento])
REFERENCES [dbo].[Asiento] ([idAsiento])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Asiento]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Pago]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Pasajero] FOREIGN KEY([idPasajero])
REFERENCES [dbo].[Pasajero] ([idPasajero])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Pasajero]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_TipoEquipaje] FOREIGN KEY([idTipoEquipaje])
REFERENCES [dbo].[TipoEquipaje] ([idTipoEquipaje])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_TipoEquipaje]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Vuelo] FOREIGN KEY([idVuelo])
REFERENCES [dbo].[Vuelo] ([idVuelo])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Vuelo]
GO
ALTER TABLE [dbo].[Tarifa]  WITH CHECK ADD  CONSTRAINT [FK_Tarifa_Clase] FOREIGN KEY([idClase])
REFERENCES [dbo].[Clase] ([idClase])
GO
ALTER TABLE [dbo].[Tarifa] CHECK CONSTRAINT [FK_Tarifa_Clase]
GO
ALTER TABLE [dbo].[Tarifa]  WITH CHECK ADD  CONSTRAINT [FK_Tarifa_Vuelo] FOREIGN KEY([idVuelo])
REFERENCES [dbo].[Vuelo] ([idVuelo])
GO
ALTER TABLE [dbo].[Tarifa] CHECK CONSTRAINT [FK_Tarifa_Vuelo]
GO
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Persona]
GO
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Rol]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Aeropuerto] FOREIGN KEY([idAirportSalida])
REFERENCES [dbo].[Aeropuerto] ([idAeropuerto])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Aeropuerto]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Aeropuerto1] FOREIGN KEY([idAirportLlegada])
REFERENCES [dbo].[Aeropuerto] ([idAeropuerto])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Aeropuerto1]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Avion] FOREIGN KEY([idAvion])
REFERENCES [dbo].[Avion] ([idAvion])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Avion]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_reservas]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizar_reservas]
(@idReserva INTEGER,@idAsiento INTEGER,@desTipoEquipaje VARCHAR(50),
@idDelPasajeroActualizado integer,
@nombreDeQuienPaga varchar(100),
@direccionDeQuienPaga  varchar(100),
@tipoDeComprobanteElegido varchar(30),
@numeroDeDocumentoDeQuienPaga varchar(15)
)
AS
	DECLARE @costoAsiento AS MONEY=(SELECT ta.Precio FROM Vuelo vu
		INNER JOIN Tarifa ta ON(ta.idVuelo=vu.idVuelo)
		WHERE ta.idClase=(SELECT idClase FROM Asiento WHERE idAsiento=@idAsiento) 
			AND vu.idVuelo=(SELECT idVuelo FROM Reserva WHERE idReserva=@idReserva));
	DECLARE @costoEquipaje AS MONEY=(SELECT Precio FROM TipoEquipaje WHERE Descripcion=@desTipoEquipaje);
	DECLARE @monto AS MONEY = @costoAsiento+@costoEquipaje;
	DECLARE @idDePago as integer =(SELECT idPago FROM Reserva WHERE idReserva=@idReserva)
	UPDATE Reserva SET idTipoEquipaje=(SELECT idTipoEquipaje FROM TipoEquipaje WHERE Descripcion=@desTipoEquipaje) 
				,idAsiento=@idAsiento,
				idPasajero=@idDelPasajeroActualizado
				WHERE idReserva=@idReserva;
	UPDATE Pago SET Monto=@monto WHERE idPago=(@idDePago);
	UPDATE DetallePago 
		SET Nombre=@nombreDeQuienPaga,
		Direccion=@direccionDeQuienPaga,
		idTipoPago=(SELECT idTipoPago FROM TipoPago where Nombre=@tipoDeComprobanteElegido),
		NumeroDocumento=@numeroDeDocumentoDeQuienPaga
		where idDetallePago=(SELECT idDetallePago from Pago where idPago=@idDePago)
GO
/****** Object:  StoredProcedure [dbo].[buscar_en_asientos_no_reservados]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[buscar_en_asientos_no_reservados](@idAsiento INTEGER,@idVuelo INTEGER)
AS
	IF @idAsiento IN (SELECT asi.idAsiento FROM Asiento asi
	INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
	WHERE idAvion=(SELECT idAvion FROM Vuelo WHERE idVuelo=@idVuelo) 
		AND idAsiento NOT IN (SELECT idAsiento FROM Reserva WHERE idVuelo=@idVuelo)) 
		BEGIN
		SELECT 1;
		RETURN;
		END
	ELSE
		BEGIN
		SELECT 100;
		RETURN;
		END
GO
/****** Object:  StoredProcedure [dbo].[buscar_en_seleccionasientos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[buscar_en_seleccionasientos](@fila INT,@letra CHAR(1),@clase VARCHAR(30),@idvuelo INTEGER)
AS
	IF @fila<>0 BEGIN
		IF @letra='' BEGIN
			SELECT asi.idAsiento,asi.Fila,asi.Letra,cla.Nombre FROM Asiento asi
			INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
			WHERE idAvion=(SELECT idAvion FROM Vuelo WHERE idVuelo=@idVuelo) 
				AND idAsiento NOT IN (SELECT idAsiento FROM Reserva WHERE idVuelo=@idVuelo) 
				AND asi.Fila=@fila AND cla.Nombre LIKE '%'+@clase+'%'
		END
		IF @letra<>'' BEGIN
			SELECT asi.idAsiento,asi.Fila,asi.Letra,cla.Nombre FROM Asiento asi
			INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
			WHERE idAvion=(SELECT idAvion FROM Vuelo WHERE idVuelo=@idVuelo) 
				AND idAsiento NOT IN (SELECT idAsiento FROM Reserva WHERE idVuelo=@idVuelo) 
				AND asi.Fila=@fila AND asi.letra=@letra AND cla.Nombre LIKE '%'+@clase+'%'
		END
	END
	IF @fila=0 BEGIN
		IF @letra='' BEGIN
			SELECT asi.idAsiento,asi.Fila,asi.Letra,cla.Nombre FROM Asiento asi
			INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
			WHERE idAvion=(SELECT idAvion FROM Vuelo WHERE idVuelo=@idVuelo) 
				AND idAsiento NOT IN (SELECT idAsiento FROM Reserva WHERE idVuelo=@idVuelo) 
				AND cla.Nombre LIKE '%'+@clase+'%'
		END
		IF @letra<>'' BEGIN
			SELECT asi.idAsiento,asi.Fila,asi.Letra,cla.Nombre FROM Asiento asi
			INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
			WHERE idAvion=(SELECT idAvion FROM Vuelo WHERE idVuelo=@idVuelo) 
				AND idAsiento NOT IN (SELECT idAsiento FROM Reserva WHERE idVuelo=@idVuelo) 
				AND asi.letra=@letra AND cla.Nombre LIKE '%'+@clase+'%'
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_reserva_con_su_pago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar_reserva_con_su_pago](@idReserva INTEGER)
AS
	UPDATE Pago SET Vigente=0 WHERE idPago=(SELECT idPago FROM Reserva WHERE idReserva=@idReserva);
	DELETE FROM Reserva WHERE idReserva=@idReserva;
GO
/****** Object:  StoredProcedure [dbo].[ingresar_detallepago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ingresar_detallepago]
(@nombre VARCHAR(100),@direccion VARCHAR(100),@nombreTipoPago VARCHAR(30),@porc INTEGER
,@numeroDeDocumentoDelPago varchar(15))
AS
	DECLARE @numTipoPago AS INTEGER;
	DECLARE @idTipoPago AS INTEGER=(SELECT idTipoPago FROM TipoPago WHERE Nombre=@nombreTipoPago);
	SET @numTipoPago=(SELECT COUNT(idTipoPago) FROM DetallePago WHERE idTipoPago=@idTipoPago);
	INSERT INTO DetallePago VALUES(@nombre,@direccion,@idTipoPago,(@numTipoPago+1),@porc,@numeroDeDocumentoDelPago);
	SELECT SCOPE_IDENTITY();
	RETURN 
GO
/****** Object:  StoredProcedure [dbo].[ingresar_lista]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ingresar_lista] (@idAsiento INTEGER)
AS
	INSERT INTO Lista DEFAULT VALUES SELECT SCOPE_IDENTITY();
	DECLARE @idLista AS INTEGER=(SELECT TOP 1 * FROM Lista ORDER BY idLista DESC);
	INSERT INTO ListasAsientos VALUES(@idLista,@idAsiento)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_pago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ingresar_pago]
(@monto MONEY,@idDetalle INTEGER)
AS
	INSERT INTO Pago VALUES(GETDATE(),@monto,@idDetalle,1);
	SELECT SCOPE_IDENTITY();
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ingresar_reserva]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ingresar_reserva] 
(@idVuelo INTEGER,@nombreTipoEquipaje VARCHAR(50),@idPago INTEGER,@idPasajero INTEGER,@idAsiento INTEGER)
AS
	DECLARE @idTipoEquipaje AS INTEGER=(SELECT idTipoEquipaje FROM TipoEquipaje WHERE Descripcion=@nombreTipoEquipaje);
	INSERT INTO Reserva VALUES(@idVuelo,@idTipoEquipaje,@idPago,@idPasajero,@idAsiento,GETDATE());
	SELECT SCOPE_IDENTITY();
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[obtener_asientos_no_reservados]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_asientos_no_reservados](@idVuelo INTEGER)
AS
	SELECT asi.idAsiento,asi.Fila,asi.Letra,cla.Nombre FROM Asiento asi
	INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
	WHERE idAvion=(SELECT idAvion FROM Vuelo WHERE idVuelo=@idVuelo) 
		AND idAsiento NOT IN (SELECT idAsiento FROM Reserva WHERE idVuelo=@idVuelo)
GO
/****** Object:  StoredProcedure [dbo].[obtener_informacion_asientos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_informacion_asientos](@idVuelo INTEGER,@idAsiento INTEGER)
AS
	SELECT asi.Fila,asi.Letra,ta.Precio,cla.Nombre FROM Asiento asi
		INNER JOIN Clase cla ON(cla.idClase=asi.idClase)
		INNER JOIN Tarifa ta ON(ta.idClase=asi.idClase)
		WHERE ta.idVuelo=@idVuelo AND asi.idAsiento=@idAsiento
GO
/****** Object:  StoredProcedure [dbo].[obtener_informacion_pago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_informacion_pago](@id INTEGER)
AS
	SELECT de.Nombre,de.Direccion,de.idTipoPago,de.numTipoPago,pa.Monto,de.PorcIGV FROM Pago pa
	INNER JOIN DetallePago de ON(de.idDetallePago=pa.idDetallePago)
	WHERE pa.idPago=@id
GO
/****** Object:  StoredProcedure [dbo].[obtener_informacion_pasajero]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_informacion_pasajero] (@idPasajero INTEGER)
AS
	SELECT pr.Nombre+' '+pr.PrimerApellido+' '+pr.SegundoApellido,pr.Edad,
	pr.Correo,pa.Nombre,psj.Pasaporte,td.Nombre,pr.numDocumento 
	FROM Pasajero psj
	INNER JOIN Persona pr ON(pr.idPersona=psj.idPersona)
	INNER JOIN Pais pa ON(pa.idPais=pr.idPais)
	INNER JOIN TipoDocumento td ON(td.idTipoDocumento=pr.idTipoDocumento)
	WHERE idPasajero=@idPasajero
GO
/****** Object:  StoredProcedure [dbo].[obtener_informacion_vuelo]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_informacion_vuelo](@id INTEGER)
AS
	SELECT v.FechaHoraSalida,aero.Nombre,aer1.Nombre,aer2.Nombre FROM Vuelo v
	INNER JOIN Aeropuerto aer1 ON(aer1.idAeropuerto=v.idAirportSalida)
	INNER JOIN Aeropuerto aer2 ON(aer2.idAeropuerto=v.idAirportLlegada)
	INNER JOIN Avion av ON(av.idAvion=v.idAvion)
	INNER JOIN Aerolinea aero ON(aero.idAerolinea=av.idAerolinea)
	WHERE v.idVuelo=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_aerolineas]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar_aerolineas]
@id INT,@nombre VARCHAR(50)
AS BEGIN
	UPDATE Aerolinea SET nombre=@nombre WHERE idAerolinea=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_aeropuerto]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_actualizar_aeropuerto]
@id integer, @nombre varchar(50),@ciudad varchar(50)
as
begin
 UPDATE Aeropuerto SET Nombre=@nombre, Ciudad=@ciudad WHERE idAeropuerto=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_aviones]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar_aviones] 
(@idAvion int,@idAerolinea int,@activo bit)
AS
	UPDATE Avion SET idAerolinea=@idAerolinea,Activo=@activo WHERE idAvion=@idAvion
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_nombre_aeropuerto]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_actualizar_nombre_aeropuerto]
@id integer, @nombre varchar(50)
as
begin
 UPDATE Aeropuerto SET Nombre=@nombre WHERE idAeropuerto=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_pasajero]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_actualizar_pasajero] 
@idPasajero int,
@idPersona int,
@nombre varchar(30),
@apellido1 varchar(20),
@apellido2 varchar(20),
@pais  varchar(50),
@tipoDoc nchar(10),
@nuDoc varchar(15),
@edad int,
@direccion varchar(100),
@ciudad varchar(30),
@codPos char(5),
@corre varchar(50),
@pasaporte char(9)
as
BEGIN

UPDATE Persona 
SET 
Nombre=@nombre,
PrimerApellido=@apellido1,
SegundoApellido=@apellido2,
idPais=(SELECT idPais FROM Pais where Nombre=@pais),
idTipoDocumento= (SELECT idTipoDocumento FROM TipoDocumento where Nombre=@tipoDoc),
numDocumento=@nuDoc,
Edad = @edad,
Direccion=@direccion,
Ciudad=@ciudad,
CodigoPostal=@codPos,
Correo=@corre
WHERE idPersona=@idPersona

UPDATE Pasajero 
SET Pasaporte=@pasaporte
WHERE idPasajero=@idPasajero
END

ALTER TABLE Pasajero 
ALTER COLUMN Pasaporte nchar(9)
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_tarifa]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar_tarifa]
@idTarifa int,
@precio money
AS 
BEGIN 
UPDATE  Tarifa
SET Precio=@precio
WHERE idTarifa=@idTarifa
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_tipoequipaje]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar_tipoequipaje](@id INTEGER,@precio MONEY)
AS
	UPDATE TipoEquipaje SET Precio=@precio WHERE idTipoEquipaje=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_trabajador]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar_trabajador] 
@idPasajero int,
@idPersona int,
@nombre varchar(30),
@apellido1 varchar(20),
@apellido2 varchar(20),
@pais  varchar(50),
@tipoDoc nchar(10),
@nuDoc varchar(15),
@edad int,
@direccion varchar(100),
@ciudad varchar(30),
@codPos char(5),
@corre varchar(50),
@nickname varchar(20),
@clave varchar(20),
@rol varchar(20)
AS
BEGIN

UPDATE Persona 
SET 
Nombre=@nombre,
PrimerApellido=@apellido1,
SegundoApellido=@apellido2,
idPais=(SELECT idPais FROM Pais where Nombre=@pais),
idTipoDocumento= (SELECT idTipoDocumento FROM TipoDocumento where Nombre=@tipoDoc),
numDocumento=@nuDoc,
Edad = @edad,
Direccion=@direccion,
Ciudad=@ciudad,
CodigoPostal=@codPos,
Correo=@corre
WHERE idPersona=@idPersona

UPDATE Trabajador 
SET Nickname=@nickname,
Contraseña=@clave,
idRol=(SELECT idRol FROM Rol WHERE Nombre=@rol)
WHERE idTrabajador=@idPasajero
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_vuelo]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar_vuelo]
@id int,
@fechasalida varchar(50),
@fechallegada varchar(50)
AS
BEGIN
UPDATE Vuelo
SET FechaHoraSalida=@fechasalida,
FechaHoraLlegada=@fechallegada
WHERE idVuelo=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_aeropuerto]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_aeropuerto]
@nombre varchar(50),
@ciudad varchar(50),
@pais varchar(50)
as
begin
select ae.idAeropuerto,ae.Nombre,ae.Ciudad,p.Nombre FROM 
Aeropuerto ae inner join Pais p
on ae.idPais=p.idPais
where ae.Nombre like '%'+@nombre+'%' and ae.Ciudad like '%'+@ciudad+'%'
and  p.Nombre like '%'+@pais+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_asiento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_asiento]
@idAvion int,
@fila int,
@clase varchar(30)
as
begin
select a.idAsiento,a.idAvion,a.Fila,a.Letra,c.Nombre FROM 
Asiento a inner join Clase c
on a.idClase=c.idClase
where a.idAvion=@idAvion and a.Fila=@fila and c.Nombre=@clase
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_asiento_1]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_asiento_1]
@idAvion int,
@fila int
as
begin
select a.idAsiento,a.idAvion,a.Fila,a.Letra,c.Nombre FROM 
Asiento a inner join Clase c
on a.idClase=c.idClase
where a.idAvion=@idAvion and a.Fila=@fila 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_Avion_por_ID]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_Avion_por_ID]
@id int
as
begin
Select av.idAvion,ae.Nombre,av.Activo from Avion av 
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
where av.idAvion=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_aviones_activos_de_aerolinea]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_aviones_activos_de_aerolinea]
@nombre as varchar(50)
as 
begin
Select av.idAvion,ae.Nombre,av.Activo from Avion av 
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
where av.Activo=1 and ae.Nombre like '%'+@nombre+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_aviones_de_aerolinea]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_aviones_de_aerolinea]
@nombre as varchar(50)
as 
begin
Select av.idAvion,ae.Nombre,av.Activo from Avion av 
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
where ae.Nombre like '%'+@nombre+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_aviones_inactivos_de_aerolinea]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_aviones_inactivos_de_aerolinea]
@nombre as varchar(50)
as 
begin
Select av.idAvion,ae.Nombre,av.Activo from Avion av 
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
where av.Activo=0 and ae.Nombre like '%'+@nombre+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_aviones_porActividad]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_aviones_porActividad]
@estaActivo as integer
as 
begin
Select av.idAvion,ae.Nombre,av.Activo from Avion av 
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
where av.Activo=@estaActivo
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_pasajero]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_pasajero]
@apPaterno varchar(20),
@apMaterno varchar(20)
as 
begin
SELECT  pa.idPasajero,pa.idPersona,pe.PrimerApellido,
pe.SegundoApellido,pe.Edad,pe.Correo,pa.Pasaporte  
from Pasajero pa inner join Persona pe
on pa.idPersona=pe.idPersona  
where pe.PrimerApellido like '%'+@apPaterno+'%'
and pe.SegundoApellido like '%'+@apMaterno+'%'
and pa.Estado=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_Tarifa]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_Tarifa]
@clase varchar(30)
AS
BEGIN
SELECT t.idTarifa,t.idVuelo,c.idClase,c.Nombre,t.Precio
FROM Tarifa t inner join Clase c
on t.idClase=c.idClase
where   c.Nombre=@clase
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_trabajador]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_trabajador]
@paterno varchar(20),
@materno varchar(20),
@rol varchar(20)
AS
BEGIN
SELECT t.idTrabajador,t.idPersona,
p.PrimerApellido,p.SegundoApellido,t.Nickname,
t.Contraseña,r.Nombre
FROM Trabajador t
INNER JOIN Persona p on t.idPersona=p.idPersona
inner join Rol r on r.idRol=t.idRol
where p.PrimerApellido like '%'+@paterno+'%'
and p.SegundoApellido like '%'+@materno+'%'
and r.Nombre like '%'+@rol+'%' and t.Estado=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_vuelos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_vuelos]
@aerolinea varchar(50),
@aeroLlegada varchar(50),
@aeroSalida varchar(50),
@fechaLlegada varchar,
@fechaSalida varchar
AS
BEGIN
;With R AS
(
    SELECT v.idVuelo,ae.Nombre as nombreAerolinea,
a.Nombre as AeropueroSalida,ap.Nombre as AeropuertoLlegada,
CONVERT(VARCHAR(10), v.FechaHoraSalida, 103) as Fecha_de_Salida,
datename(HOUR,v.FechaHoraSalida)+':'+datename(MINUTE,v.FechaHoraSalida) as Hora_de_Salida
,convert(VARCHAR(10), v.FechaHoraSalida, 103) as fecha_de_llegada,
datename(HOUR,v.FechaHoraLlegada)+':'+DATENAME(MINUTE,v.FechaHoraLlegada) 
AS Hora_de_Llegada
 FROM Vuelo v
inner join Avion av on v.idAvion=av.idAvion
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
inner join Aeropuerto ap on ap.idAeropuerto=v.idAirportLlegada
inner join Aeropuerto a on a.idAeropuerto=v.idAirportSalida
) 
Select * 
From R
WHERE R.nombreAerolinea =@aerolinea and
R.AeropueroSalida =@aeroSalida
and R.AeropuertoLlegada =@aeroLlegada and  (R.Fecha_de_Salida=@fechaSalida 
or R.fecha_de_llegada=@fechaLlegada)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_vuelos_1]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_vuelos_1]
@aerolinea varchar(50),
@aeroLlegada varchar(50),
@aeroSalida varchar(50)
AS
BEGIN
;With R AS
(
    SELECT v.idVuelo,ae.Nombre as nombreAerolinea,
a.Nombre as AeropueroSalida,ap.Nombre as AeropuertoLlegada,
CONVERT(VARCHAR(10), v.FechaHoraSalida, 103) as Fecha_de_Salida,
datename(HOUR,v.FechaHoraSalida)+':'+datename(MINUTE,v.FechaHoraSalida) as Hora_de_Salida
,convert(VARCHAR(10), v.FechaHoraSalida, 103) as fecha_de_llegada,
datename(HOUR,v.FechaHoraLlegada)+':'+DATENAME(MINUTE,v.FechaHoraLlegada) 
AS Hora_de_Llegada, av.idAvion
 FROM Vuelo v
inner join Avion av on v.idAvion=av.idAvion
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
inner join Aeropuerto ap on ap.idAeropuerto=v.idAirportLlegada
inner join Aeropuerto a on a.idAeropuerto=v.idAirportSalida
) 
Select * 
From R
WHERE R.nombreAerolinea like '%'+@aerolinea+'%' and
R.AeropueroSalida like '%'+@aeroSalida+'%'
and R.AeropuertoLlegada like '%'+@aeroLlegada +'%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_vuelos_2]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_vuelos_2]
@aerolinea varchar(50),
@aeroLlegada varchar(50),
@aeroSalida varchar(50),
@fechaSalida varchar(50)
AS
BEGIN
;With R AS
(
    SELECT v.idVuelo,ae.Nombre as nombreAerolinea,
a.Nombre as AeropueroSalida,ap.Nombre as AeropuertoLlegada,
CONVERT(VARCHAR(10), v.FechaHoraSalida, 103) as Fecha_de_Salida,
datename(HOUR,v.FechaHoraSalida)+':'+datename(MINUTE,v.FechaHoraSalida) as Hora_de_Salida
,convert(VARCHAR(10), v.FechaHoraSalida, 103) as fecha_de_llegada,
datename(HOUR,v.FechaHoraLlegada)+':'+DATENAME(MINUTE,v.FechaHoraLlegada) 
AS Hora_de_Llegada, av.idAvion
 FROM Vuelo v
inner join Avion av on v.idAvion=av.idAvion
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
inner join Aeropuerto ap on ap.idAeropuerto=v.idAirportLlegada
inner join Aeropuerto a on a.idAeropuerto=v.idAirportSalida
) 
Select * 
From R
WHERE R.nombreAerolinea like '%'+@aerolinea+'%' and
R.AeropueroSalida like '%'+@aeroSalida+'%'
and R.AeropuertoLlegada like '%'+@aeroLlegada+'%' and 
R.Fecha_de_Salida=@fechaSalida
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_vuelos_3]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscar_vuelos_3]
@aerolinea varchar(50),
@aeroLlegada varchar(50),
@aeroSalida varchar(50),
@fechaLlegada varchar(50)
AS
BEGIN
;With R AS
(
    SELECT v.idVuelo,ae.Nombre as nombreAerolinea,
a.Nombre as AeropueroSalida,ap.Nombre as AeropuertoLlegada,
CONVERT(VARCHAR(10), v.FechaHoraSalida, 103) as Fecha_de_Salida,
datename(HOUR,v.FechaHoraSalida)+':'+datename(MINUTE,v.FechaHoraSalida) as Hora_de_Salida
,convert(VARCHAR(10), v.FechaHoraSalida, 103) as fecha_de_llegada,
datename(HOUR,v.FechaHoraLlegada)+':'+DATENAME(MINUTE,v.FechaHoraLlegada) 
AS Hora_de_Llegada, av.idAvion
 FROM Vuelo v
inner join Avion av on v.idAvion=av.idAvion
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
inner join Aeropuerto ap on ap.idAeropuerto=v.idAirportLlegada
inner join Aeropuerto a on a.idAeropuerto=v.idAirportSalida
) 
Select * 
From R
WHERE R.nombreAerolinea like '%'+@aerolinea+'%' and
R.AeropueroSalida like '%'+@aeroSalida+'%'
and R.AeropuertoLlegada like '%'+@aeroLlegada+'%' and 
R.fecha_de_llegada=@fechaLlegada
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_Aviones]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_Aviones]
AS
BEGIN
Select av.idAvion,ae.Nombre,av.Activo from Avion av inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_idVuelos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_idVuelos]
as
begin
SELECT idVuelo FROM Vuelo
end
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_pasajeros]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_pasajeros]
AS
BEGIN
SELECT  pa.idPasajero,pa.idPersona,pe.PrimerApellido,
pe.SegundoApellido,pe.Edad,pe.Correo,pa.Pasaporte  
from Pasajero pa inner join Persona pe
on pa.idPersona=pe.idPersona  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_pasajeros_activos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_pasajeros_activos]
AS
BEGIN
SELECT  pa.idPasajero,pa.idPersona,pe.PrimerApellido,
pe.SegundoApellido,pe.Edad,pe.Correo,pa.Pasaporte  
from Pasajero pa inner join Persona pe
on pa.idPersona=pe.idPersona  where pa.Estado=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_reservas]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_reservas]
AS
	SELECT re.idReserva,re.idVuelo,air1.Nombre AS Air1,air2.Nombre AS Air2,
	v.FechaHoraSalida,te.Descripcion,pg.idPago,pg.idDetallePago,
	pg.Monto,cla.Nombre AS Clase,ps.idPasajero,per.numDocumento,asi.idAsiento
	FROM Reserva re
	INNER JOIN Vuelo v ON (v.idVuelo=re.idVuelo)
	INNER JOIN Aeropuerto air1 ON (air1.idAeropuerto=v.idAirportSalida)
	INNER JOIN Aeropuerto air2 ON (air2.idAeropuerto=v.idAirportLlegada)
	INNER JOIN TipoEquipaje te ON (te.idTipoEquipaje=re.idTipoEquipaje)
	INNER JOIN Pago pg ON (pg.idPago=re.idPago)
	INNER JOIN Asiento asi ON (asi.idAsiento=re.idAsiento)
	INNER JOIN Clase cla ON (cla.idClase=asi.idClase)
	INNER JOIN Pasajero ps ON (ps.idPasajero=re.idPasajero)
	INNER JOIN Persona per ON (per.idPersona=ps.idPersona)
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_reservas_concombos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_reservas_concombos]
(@Air1 VARCHAR(50),@air2 VARCHAR(50),@clase VARCHAR(30),@equipaje VARCHAR(50))
AS
	SELECT * FROM (SELECT re.idReserva,re.idVuelo,air1.Nombre AS Air1,air2.Nombre AS Air2,
	v.FechaHoraSalida,te.Descripcion,pg.idPago,pg.idDetallePago,
	pg.Monto,cla.Nombre AS Clase,ps.idPasajero,per.numDocumento,asi.idAsiento
	FROM Reserva re
	INNER JOIN Vuelo v ON (v.idVuelo=re.idVuelo)
	INNER JOIN Aeropuerto air1 ON (air1.idAeropuerto=v.idAirportSalida)
	INNER JOIN Aeropuerto air2 ON (air2.idAeropuerto=v.idAirportLlegada)
	INNER JOIN TipoEquipaje te ON (te.idTipoEquipaje=re.idTipoEquipaje)
	INNER JOIN Pago pg ON (pg.idPago=re.idPago)
	INNER JOIN Asiento asi ON (asi.idAsiento=re.idAsiento)
	INNER JOIN Clase cla ON (cla.idClase=asi.idClase)
	INNER JOIN Pasajero ps ON (ps.idPasajero=re.idPasajero)
	INNER JOIN Persona per ON (per.idPersona=ps.idPersona)) AS Tabla
	WHERE tabla.Air1 LIKE '%'+@air1+'%' AND tabla.Air2 LIKE '%'+@air2+'%' AND
		tabla.Clase LIKE '%'+@clase+'%' AND tabla.Descripcion LIKE '%'+@equipaje+'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_reservas_confecha]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_reservas_confecha]
(@Air1 VARCHAR(50),@air2 VARCHAR(50),@clase VARCHAR(30),@equipaje VARCHAR(50),@fecha DATE)
AS
	SELECT * FROM (SELECT re.idReserva,re.idVuelo,air1.Nombre AS Air1,air2.Nombre AS Air2,
	v.FechaHoraSalida,te.Descripcion,pg.idPago,pg.idDetallePago,
	pg.Monto,cla.Nombre AS Clase,ps.idPasajero,per.numDocumento,asi.idAsiento
	FROM Reserva re
	INNER JOIN Vuelo v ON (v.idVuelo=re.idVuelo)
	INNER JOIN Aeropuerto air1 ON (air1.idAeropuerto=v.idAirportSalida)
	INNER JOIN Aeropuerto air2 ON (air2.idAeropuerto=v.idAirportLlegada)
	INNER JOIN TipoEquipaje te ON (te.idTipoEquipaje=re.idTipoEquipaje)
	INNER JOIN Pago pg ON (pg.idPago=re.idPago)
	INNER JOIN Asiento asi ON (asi.idAsiento=re.idAsiento)
	INNER JOIN Clase cla ON (cla.idClase=asi.idClase)
	INNER JOIN Pasajero ps ON (ps.idPasajero=re.idPasajero)
	INNER JOIN Persona per ON (per.idPersona=ps.idPersona)) AS Tabla
	WHERE tabla.Air1 LIKE '%'+@air1+'%' AND tabla.Air2 LIKE '%'+@air2+'%' AND
		tabla.Clase LIKE '%'+@clase+'%' AND tabla.Descripcion LIKE '%'+@equipaje+'%' AND
		FechaHoraSalida=@fecha
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_tarifas]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_tarifas]
AS
BEGIN
SELECT t.idTarifa,t.idVuelo,c.idClase,c.Nombre,t.Precio
FROM Tarifa t inner join Clase c
on t.idClase=c.idClase where t.Estado=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_trabajadores]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_trabajadores]
as
begin
SELECT T.idTrabajador,P.idPersona,P.PrimerApellido,
P.SegundoApellido, T.Nickname, T.Contraseña,R.Nombre
FROM Trabajador T
inner join Persona P on T.idPersona=P.idPersona
inner join Rol R on R.idRol=T.idRol
WHERE Estado=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_cargar_vuelos]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cargar_vuelos]
AS
BEGIN
SELECT v.idVuelo,ae.Nombre as nombreAerolinea,
a.Nombre as AeropueroSalida,ap.Nombre as AeropuertoLlegada,
convert(varchar,DAY(v.FechaHoraSalida))+'/'+
convert(varchar,MONTH(v.FechaHoraSalida))
+'/'+convert(varchar,YEAR(v.FechaHoraSalida)) as Fecha_de_Salida,
datename(HOUR,v.FechaHoraSalida)+':'+datename(MINUTE,v.FechaHoraSalida) as Hora_de_Salida
,convert(varchar,DAY(v.FechaHoraLlegada))+'/'+
convert(varchar,MONTH(v.FechaHoraLlegada))
+'/'+convert(varchar,YEAR(v.FechaHoraLlegada)) as fecha_de_llegada,
datename(HOUR,v.FechaHoraLlegada)+':'+
DATENAME(MINUTE,v.FechaHoraLlegada) 
AS Hora_de_Llegada,av.idAvion
FROM Vuelo v
inner join Avion av on v.idAvion=av.idAvion
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
inner join Aeropuerto ap on ap.idAeropuerto=v.idAirportLlegada
inner join Aeropuerto a on a.idAeropuerto=v.idAirportSalida

END
GO
/****** Object:  StoredProcedure [dbo].[sp_comprobate]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_comprobate]
@id integer
as 
begin
SELECT res.idReserva, res.FechaHora as fechaReserva,(per.Nombre+' '+per.PrimerApellido+' '+per.SegundoApellido) as NombrePasajero
	,per.Edad as Edad ,per.Correo as correo,pa.Nombre as pais,pas.Pasaporte as pasaporte,
	per.numDocumento as documentoPasajero,vue.FechaHoraSalida as fechaVuelo, aero1.Nombre as Aero_Salida,
	aero2.Nombre as Aero_Llegada, al.Nombre, asi.Fila, asi.Letra, pag.Monto,clas.Nombre,te.Descripcion,
	te.Precio,dp.Nombre,dp.Direccion,tp.Nombre,dp.NumeroDocumento,pag.Monto,dp.PorcIGV,dp.numTipoPago
	FROM Reserva res
	inner join Vuelo vue on res.idVuelo = vue.idVuelo
	inner join Asiento asi on asi.idAsiento=res.idAsiento
	inner join Avion av on av.idAvion=vue.idAvion
	INNER JOIN Clase clas ON clas.idClase=asi.idClase
	inner join Tarifa ta ON ta.idClase=clas.idClase
	inner join TipoEquipaje te on te.idTipoEquipaje=res.idTipoEquipaje
	inner join Pago pag on pag.idPago = res.idPago 
	inner join DetallePago dp on dp.idDetallePago=pag.idDetallePago
	inner join TipoPago tp on dp.idTipoPago=tp.idTipoPago
	inner join Pasajero pas on pas.idPasajero=res.idPasajero
	inner join Persona per on pas.idPersona=per.idPersona
	inner join Pais pa on per.idPais=pa.idPais
	inner join Aeropuerto aero1 on aero1.idAeropuerto=vue.idAirportSalida
	inner join Aeropuerto aero2 on aero2.idAeropuerto=vue.idAirportLlegada
	inner join Aerolinea al on al.idAerolinea=av.idAerolinea
	where res.idReserva= @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_aerolineas]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_aerolineas]
@id int
AS BEGIN
	DELETE FROM Aerolinea WHERE idAerolinea=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_aeropuerto]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_aeropuerto]
@id int
AS BEGIN
	DELETE FROM Aeropuerto WHERE idAeropuerto=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_asiento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_asiento]
@id int
as
begin
DELETE FROM Asiento WHERE idAsiento=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_aviones]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_aviones](@idAvion int)
AS
	DELETE FROM Avion WHERE idAvion=@idAvion
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_clase]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_clase](@id INTEGER)
AS
	DELETE FROM Clase WHERE idClase=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_pais]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_pais](@id INTEGER)
AS
	DELETE FROM Pais WHERE idPais=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_pasajero]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_pasajero]
@id int
AS
BEGIN
UPDATE Pasajero set Estado=0 where idPasajero=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_rol]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_rol](@id INTEGER)
AS
	DELETE FROM Rol WHERE idRol=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_tarifa]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_tarifa]
@id int
AS
BEGIN
DELETE FROM Tarifa where idTarifa=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_tipodocumento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_tipodocumento](@id INTEGER)
AS
	DELETE FROM TipoDocumento WHERE idTipoDocumento=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_tipoequipaje]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_tipoequipaje](@id INTEGER)
AS
	DELETE FROM TipoEquipaje WHERE idTipoEquipaje=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_tipopago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_tipopago](@id INTEGER)
AS
	DELETE FROM TipoPago WHERE idTipoPago=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_trabajador]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_trabajador]
@id int
AS
BEGIN
UPDATE Trabajador set Estado=0 where idTrabajador=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_turno]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_turno](@id INTEGER)
AS
	DELETE FROM Turno WHERE idTurno=@id
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_vuelo]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar_vuelo]
@id int
as
begin
DELETE FROM Vuelo where idVuelo=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_aerolinea]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_aerolinea]
@nombre as varchar(50)
AS
BEGIN
	INSERT INTO Aerolinea VALUES(@nombre);
	return 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_aeropuerto]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_aeropuerto]
@nombre varchar(50),
@ciudad varchar(50),
@pais varchar(50)
as
begin
	declare @idpa integer
	set @idpa = (Select idPais from Pais where Nombre=@pais)
	INSERT INTO Aeropuerto VALUES (@nombre,@ciudad,@idpa)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_aeropuerto1]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertar_aeropuerto1]
@nombre varchar(50),
@ciudad varchar(50),
@pais varchar(50)
AS 
BEGIN
	DECLARE @idP int;
	SET @idP= (SELECT idPais FROM Pais where Nombre=@pais)
	if @idP is  null
	begin
		INSERT INTO Pais values(@pais)
		SET @idP= (SELECT idPais FROM Pais where Nombre=@pais)
	end
	INSERT INTO Aeropuerto VALUES (@nombre,@ciudad,@idP)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_asiento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_asiento]
@idAvion int,
@fila int,
@letra char(1),
@clase varchar(30)
as
begin
	declare @idclass int;
	set @idclass=(select idClase from Clase WHERE Nombre=@clase)

	insert into Asiento VALUES (@idAvion,@fila,@letra,@idclass)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_avion]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_avion]
@nombreAerolinea varchar(50),@estado varchar(1)
AS 
BEGIN
	Declare @idAeroline int;
	set @idAeroline= (Select idAerolinea from Aerolinea where Nombre=@nombreAerolinea)
	declare @estado1 int;
	if @estado='1'
	begin
	set @estado1=1
	END
	else
	begin
	set @estado1=0
	end

	INSERT INTO Avion VALUES(@idAeroline,@estado1);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_CambiosRegistrados]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_CambiosRegistrados]
@idTrabajador as integer,
@operacion as varchar(20),
@tabla as varchar(20),
@idRegistro as integer
AS 
BEGIN
INSERT INTO CambiosRegistrados VALUES (@idTrabajador,@operacion,@tabla,GETDATE(),@idRegistro)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_clase]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_clase](@nombre VARCHAR(30))
AS
	INSERT INTO Clase VALUES(@nombre)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_pais]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_pais](@nombre VARCHAR(50))
AS
	INSERT INTO Pais VALUES(@nombre)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_pasajero]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_pasajero]
@nombre varchar(30),
@apellido1 varchar(20),
@apellido2 varchar(20),
@pais  varchar(50),
@tipoDoc nchar(10),
@nuDoc varchar(15),
@edad int,
@direccion varchar(100),
@ciudad varchar(30),
@codPos char(5),
@corre varchar(50),
@pasaporte char(9)
AS
BEGIN 
DECLARE @idPa int, @idTipDoc int;
SET @idPa = (SELECT idPais from Pais where Nombre=@pais)
SET @idTipDoc=(SELECT idTipoDocumento from TipoDocumento where Nombre=@tipoDoc)
INSERT INTO PERSONA VALUES (@nombre,@apellido1,@apellido2,@idPa,@idTipDoc,@nuDoc,@edad,@direccion,@ciudad,@codPos,@corre)
DECLARE	@idPersona int
SET @idPersona=((select top 1  idPersona From Persona order by idPersona desc))
insert into Pasajero(idPersona,Pasaporte) values(@idPersona,@pasaporte)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_rol]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_rol](@nombre VARCHAR(20))
AS
	INSERT INTO Rol VALUES(@nombre)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_tarifa]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_tarifa]
@nombre varchar(30),
@idVuelo int,
@precio money
AS 
BEGIN 
DECLARE @idclase int
SET @idclase=(SELECT idClase FROM Clase where Nombre=@nombre)
INSERT INTO Tarifa(idClase,idVuelo,Precio) VALUES (@idclase,@idVuelo,@precio)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_tipodocumento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_tipodocumento](@nombre VARCHAR(10))
AS
	INSERT INTO TipoDocumento VALUES(@nombre)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_tipoequipaje]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_tipoequipaje](@decripcion VARCHAR(50),@precio MONEY)
AS
	INSERT INTO TipoEquipaje VALUES(@decripcion,@precio)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_tipopago]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_tipopago](@nombre VARCHAR(30))
AS
	INSERT INTO TipoPago VALUES(@nombre)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_trabajador]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_trabajador]
@nombre varchar(30),
@apellido1 varchar(20),
@apellido2 varchar(20),
@pais  varchar(50),
@tipoDoc nchar(10),
@nuDoc varchar(15),
@edad int,
@direccion varchar(100),
@ciudad varchar(30),
@codPos char(5),
@corre varchar(50),
@nickname varchar(20),
@clave varchar(20),
@rol varchar(20)
AS
BEGIN 
DECLARE @idPa int, @idTipDoc int;
SET @idPa = (SELECT idPais from Pais where Nombre=@pais)
SET @idTipDoc=(SELECT idTipoDocumento from TipoDocumento where Nombre=@tipoDoc)
INSERT INTO PERSONA VALUES (@nombre,@apellido1,@apellido2,@idPa,@idTipDoc,@nuDoc,@edad,@direccion,@ciudad,@codPos,@corre)
DECLARE	@idPersona int,@idRol int
SET @idPersona=((select top 1  idPersona From Persona order by idPersona desc))
SET @idRol = (SELECT idRol From Rol where Nombre=@rol)
insert into Trabajador(idPersona,Nickname,Contraseña,idRol) values(@idPersona,@nickname,@clave,@idRol)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_turno]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_turno](@nombre VARCHAR(20))
AS
	INSERT INTO Turno VALUES(@nombre)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_vuelo]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_vuelo]
@avion int,
@aeroSalida varchar,
@aeroLlegada varchar,
@fechaSalida varchar,
@fechaLlegada varchar
as
begin

INSERT INTO Vuelo 
values (
@avion,(SELECT idAeropuerto FROM Aeropuerto where Nombre=@aeroSalida),
(SELECT idAeropuerto FROM Aeropuerto where Nombre=@aeroLlegada),
@fechaSalida,@fechaLlegada
);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_pasajero_seleccionado]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_pasajero_seleccionado]
@idPersona int
AS
BEGIN
SELECT p.Nombre,pa.Nombre,p.Ciudad,p.Direccion,p.CodigoPostal,
tp.Nombre,p.numDocumento
FROM Persona p
INNER JOIN Pais pa on pa.idPais=p.idPais
INNER JOIN TipoDocumento tp on
tp.idTipoDocumento=p.idTipoDocumento
WHERE p.idPersona=@idPersona
END
GO
/****** Object:  StoredProcedure [dbo].[sp_trabajador_seleccionado]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_trabajador_seleccionado]
@idPersona int
AS
BEGIN
SELECT p.Nombre,
p.Edad,
pa.Nombre,
p.Ciudad,
p.Direccion,
p.CodigoPostal,
tp.Nombre,
p.numDocumento,
p.Correo
FROM Persona p
INNER JOIN Pais pa on pa.idPais=p.idPais
INNER JOIN TipoDocumento tp on
tp.idTipoDocumento=p.idTipoDocumento
WHERE p.idPersona=@idPersona
END
GO
/****** Object:  StoredProcedure [dbo].[sp_vuelo_desde_asiento]    Script Date: 02/11/2022 13:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_vuelo_desde_asiento]
@id int
AS
BEGIN
;With R AS
(
    SELECT v.idVuelo as id_Vuelo,ae.Nombre as nombreAerolinea,
a.Nombre as AeropueroSalida,ap.Nombre as AeropuertoLlegada,
CONVERT(VARCHAR(10), v.FechaHoraSalida, 103) as Fecha_de_Salida,
datename(HOUR,v.FechaHoraSalida)+':'+datename(MINUTE,v.FechaHoraSalida) as Hora_de_Salida
,convert(VARCHAR(10), v.FechaHoraSalida, 103) as fecha_de_llegada,
datename(HOUR,v.FechaHoraLlegada)+':'+DATENAME(MINUTE,v.FechaHoraLlegada) 
AS Hora_de_Llegada, av.idAvion
 FROM Vuelo v
inner join Avion av on v.idAvion=av.idAvion
inner join Aerolinea ae on av.idAerolinea=ae.idAerolinea
inner join Aeropuerto ap on ap.idAeropuerto=v.idAirportLlegada
inner join Aeropuerto a on a.idAeropuerto=v.idAirportSalida
) 
Select * 
From R
WHERE R.id_Vuelo=@id
END
GO
USE [master]
GO
ALTER DATABASE [ReservaVuelo] SET  READ_WRITE 
GO
