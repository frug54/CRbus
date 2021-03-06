USE [master]
GO
/****** Object:  Database [CRbus]    Script Date: 21/11/2016 22:09:21 ******/
CREATE DATABASE [CRbus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRbus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CRbus.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CRbus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CRbus_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CRbus] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRbus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRbus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRbus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRbus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRbus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRbus] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRbus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRbus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRbus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRbus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRbus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRbus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRbus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRbus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRbus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRbus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRbus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRbus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRbus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRbus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRbus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRbus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRbus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRbus] SET RECOVERY FULL 
GO
ALTER DATABASE [CRbus] SET  MULTI_USER 
GO
ALTER DATABASE [CRbus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRbus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRbus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRbus] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CRbus] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRbus', N'ON'
GO
USE [CRbus]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bus](
	[IdBus] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](50) NOT NULL,
	[Año] [date] NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[CapacidadAcientos] [int] NOT NULL,
	[CapacidadDePie] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[FkCompañia] [int] NOT NULL,
	[FkChofer] [int] NOT NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[IdBus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canton](
	[IdCanton] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[IdCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[IdChofer] [int] IDENTITY(1,1) NOT NULL,
	[FkCompañia] [int] NOT NULL,
	[FkPersona] [int] NULL,
 CONSTRAINT [PK_TipoPersona] PRIMARY KEY CLUSTERED 
(
	[IdChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compañia]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compañia](
	[CedJuridica] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CuentaCliente] [varchar](50) NOT NULL,
	[IdCompañia] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Compañia] PRIMARY KEY CLUSTERED 
(
	[IdCompañia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[Detalle] [varchar](50) NOT NULL,
	[FkCanton] [int] NOT NULL,
	[FkDistrito] [int] NOT NULL,
	[FkProvincia] [int] NOT NULL,
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Distrito](
	[IdDistrito] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED 
(
	[IdDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historico]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico](
	[IdHistorico] [int] IDENTITY(1,1) NOT NULL,
	[Tarifa] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[FkRuta] [int] NOT NULL,
 CONSTRAINT [PK_Historico] PRIMARY KEY CLUSTERED 
(
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParadaDeRutaPorViaje]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParadaDeRutaPorViaje](
	[idParadaDeRutaPorViaje] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[FkParadaPorRuta] [int] NOT NULL,
	[FkViaje] [int] NOT NULL,
 CONSTRAINT [PK_ParadaDeRutaPorViaje] PRIMARY KEY CLUSTERED 
(
	[idParadaDeRutaPorViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParadaPorRuta]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParadaPorRuta](
	[IdParadaPorRuta] [int] IDENTITY(1,1) NOT NULL,
	[FkRuta] [int] NOT NULL,
	[FkParada] [int] NOT NULL,
 CONSTRAINT [PK_ParadaPorRuta] PRIMARY KEY CLUSTERED 
(
	[IdParadaPorRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paradas]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paradas](
	[IdParada] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FkDireccion] [int] NOT NULL,
 CONSTRAINT [PK_Paradas] PRIMARY KEY CLUSTERED 
(
	[IdParada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ruta](
	[IdRuta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Tarifa] [int] NOT NULL,
	[FkEmpresa] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Ruta] PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RutaPorBus]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutaPorBus](
	[IdRutaPorBus] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[FkRuta] [int] NOT NULL,
	[FkBus] [int] NOT NULL,
 CONSTRAINT [PK_RutaPorBus] PRIMARY KEY CLUSTERED 
(
	[IdRutaPorBus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Saldo] [int] NOT NULL,
	[CuentaCliente] [varchar](50) NOT NULL,
	[FkPersona] [int] NOT NULL,
	[FechaDeNacimiento] [date] NOT NULL,
	[FkDireccion] [int] NOT NULL,
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioPorViaje]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioPorViaje](
	[IdUsuarioPorViaje] [int] NOT NULL,
	[HoraSubida] [datetime] NOT NULL,
	[HoraBajada] [datetime] NOT NULL,
	[FkUsuario] [int] NOT NULL,
	[FkViaje] [int] NOT NULL,
	[FkParadaSubida] [int] NOT NULL,
	[FkParadaBajada] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 21/11/2016 22:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viaje](
	[IdViaje] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[DisponibleAsiento] [int] NOT NULL,
	[DisponibleApie] [int] NOT NULL,
	[FkBus] [int] NOT NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[IdViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Chofer] FOREIGN KEY([FkChofer])
REFERENCES [dbo].[Chofer] ([IdChofer])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Chofer]
GO
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Compañia] FOREIGN KEY([FkCompañia])
REFERENCES [dbo].[Compañia] ([IdCompañia])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Compañia]
GO
ALTER TABLE [dbo].[Chofer]  WITH CHECK ADD  CONSTRAINT [FK_Chofer_Compañia] FOREIGN KEY([FkCompañia])
REFERENCES [dbo].[Compañia] ([IdCompañia])
GO
ALTER TABLE [dbo].[Chofer] CHECK CONSTRAINT [FK_Chofer_Compañia]
GO
ALTER TABLE [dbo].[Chofer]  WITH CHECK ADD  CONSTRAINT [FK_TipoPersona_Persona] FOREIGN KEY([FkPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Chofer] CHECK CONSTRAINT [FK_TipoPersona_Persona]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Canton] FOREIGN KEY([FkCanton])
REFERENCES [dbo].[Canton] ([IdCanton])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Canton]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Distrito] FOREIGN KEY([FkDistrito])
REFERENCES [dbo].[Distrito] ([IdDistrito])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Distrito]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Provincia] FOREIGN KEY([FkProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Provincia]
GO
ALTER TABLE [dbo].[Historico]  WITH CHECK ADD  CONSTRAINT [FK_Historico_Ruta] FOREIGN KEY([FkRuta])
REFERENCES [dbo].[Ruta] ([IdRuta])
GO
ALTER TABLE [dbo].[Historico] CHECK CONSTRAINT [FK_Historico_Ruta]
GO
ALTER TABLE [dbo].[ParadaDeRutaPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_ParadaDeRutaPorViaje_ParadaPorRuta] FOREIGN KEY([FkParadaPorRuta])
REFERENCES [dbo].[ParadaPorRuta] ([IdParadaPorRuta])
GO
ALTER TABLE [dbo].[ParadaDeRutaPorViaje] CHECK CONSTRAINT [FK_ParadaDeRutaPorViaje_ParadaPorRuta]
GO
ALTER TABLE [dbo].[ParadaDeRutaPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_ParadaDeRutaPorViaje_Viaje] FOREIGN KEY([FkViaje])
REFERENCES [dbo].[Viaje] ([IdViaje])
GO
ALTER TABLE [dbo].[ParadaDeRutaPorViaje] CHECK CONSTRAINT [FK_ParadaDeRutaPorViaje_Viaje]
GO
ALTER TABLE [dbo].[ParadaPorRuta]  WITH CHECK ADD  CONSTRAINT [FK_ParadaPorRuta_Paradas] FOREIGN KEY([FkParada])
REFERENCES [dbo].[Paradas] ([IdParada])
GO
ALTER TABLE [dbo].[ParadaPorRuta] CHECK CONSTRAINT [FK_ParadaPorRuta_Paradas]
GO
ALTER TABLE [dbo].[ParadaPorRuta]  WITH CHECK ADD  CONSTRAINT [FK_ParadaPorRuta_Ruta] FOREIGN KEY([FkRuta])
REFERENCES [dbo].[Ruta] ([IdRuta])
GO
ALTER TABLE [dbo].[ParadaPorRuta] CHECK CONSTRAINT [FK_ParadaPorRuta_Ruta]
GO
ALTER TABLE [dbo].[Paradas]  WITH CHECK ADD  CONSTRAINT [FK_Paradas_Direccion] FOREIGN KEY([FkDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Paradas] CHECK CONSTRAINT [FK_Paradas_Direccion]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Compañia] FOREIGN KEY([FkEmpresa])
REFERENCES [dbo].[Compañia] ([IdCompañia])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Compañia]
GO
ALTER TABLE [dbo].[RutaPorBus]  WITH CHECK ADD  CONSTRAINT [FK_RutaPorBus_Bus] FOREIGN KEY([FkBus])
REFERENCES [dbo].[Bus] ([IdBus])
GO
ALTER TABLE [dbo].[RutaPorBus] CHECK CONSTRAINT [FK_RutaPorBus_Bus]
GO
ALTER TABLE [dbo].[RutaPorBus]  WITH CHECK ADD  CONSTRAINT [FK_RutaPorBus_Ruta] FOREIGN KEY([FkRuta])
REFERENCES [dbo].[Ruta] ([IdRuta])
GO
ALTER TABLE [dbo].[RutaPorBus] CHECK CONSTRAINT [FK_RutaPorBus_Ruta]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Direccion] FOREIGN KEY([FkDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Direccion]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([FkPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
ALTER TABLE [dbo].[UsuarioPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPorViaje_ParadaDeRutaPorViaje] FOREIGN KEY([FkParadaSubida])
REFERENCES [dbo].[ParadaDeRutaPorViaje] ([idParadaDeRutaPorViaje])
GO
ALTER TABLE [dbo].[UsuarioPorViaje] CHECK CONSTRAINT [FK_UsuarioPorViaje_ParadaDeRutaPorViaje]
GO
ALTER TABLE [dbo].[UsuarioPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPorViaje_ParadaDeRutaPorViaje1] FOREIGN KEY([FkParadaBajada])
REFERENCES [dbo].[ParadaDeRutaPorViaje] ([idParadaDeRutaPorViaje])
GO
ALTER TABLE [dbo].[UsuarioPorViaje] CHECK CONSTRAINT [FK_UsuarioPorViaje_ParadaDeRutaPorViaje1]
GO
ALTER TABLE [dbo].[UsuarioPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPorViaje_Usuario] FOREIGN KEY([FkUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioPorViaje] CHECK CONSTRAINT [FK_UsuarioPorViaje_Usuario]
GO
ALTER TABLE [dbo].[UsuarioPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPorViaje_Viaje] FOREIGN KEY([FkViaje])
REFERENCES [dbo].[Viaje] ([IdViaje])
GO
ALTER TABLE [dbo].[UsuarioPorViaje] CHECK CONSTRAINT [FK_UsuarioPorViaje_Viaje]
GO
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Bus] FOREIGN KEY([FkBus])
REFERENCES [dbo].[Bus] ([IdBus])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Bus]
GO
USE [master]
GO
ALTER DATABASE [CRbus] SET  READ_WRITE 
GO