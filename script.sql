USE [master]
GO
/****** Object:  Database [tareas]    Script Date: 11/09/2021 20:38:18 ******/
CREATE DATABASE [tareas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tareas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tareas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tareas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tareas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tareas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tareas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tareas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tareas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tareas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tareas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tareas] SET ARITHABORT OFF 
GO
ALTER DATABASE [tareas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tareas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tareas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tareas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tareas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tareas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tareas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tareas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tareas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tareas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tareas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tareas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tareas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tareas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tareas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tareas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tareas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tareas] SET RECOVERY FULL 
GO
ALTER DATABASE [tareas] SET  MULTI_USER 
GO
ALTER DATABASE [tareas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tareas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tareas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tareas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tareas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tareas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tareas', N'ON'
GO
ALTER DATABASE [tareas] SET QUERY_STORE = OFF
GO
USE [tareas]
GO
/****** Object:  Table [dbo].[carpeta]    Script Date: 11/09/2021 20:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carpeta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom_carpeta] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarea]    Script Date: 11/09/2021 20:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_carpeta] [int] NULL,
	[Nom_tarea] [varchar](40) NULL,
	[Descripcion] [varchar](256) NULL,
	[Estado] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[carpeta] ON 

INSERT [dbo].[carpeta] ([Id], [Nom_carpeta]) VALUES (2, N'Carpeta 2')
INSERT [dbo].[carpeta] ([Id], [Nom_carpeta]) VALUES (3, N'Carpeta3')
INSERT [dbo].[carpeta] ([Id], [Nom_carpeta]) VALUES (4, N'Carpeta 3')
INSERT [dbo].[carpeta] ([Id], [Nom_carpeta]) VALUES (5, N'Carpeta 4')
INSERT [dbo].[carpeta] ([Id], [Nom_carpeta]) VALUES (6, N'Carpeta 5')
INSERT [dbo].[carpeta] ([Id], [Nom_carpeta]) VALUES (7, N'Carpeta 1')
SET IDENTITY_INSERT [dbo].[carpeta] OFF
GO
SET IDENTITY_INSERT [dbo].[tarea] ON 

INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (1, 2, N'Hacer la compra', N'Tomates, etc', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (2, 2, N'string', N'Otra descripcion...', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (3, 2, N'Ordenar', N'Ordenar la cocina', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (4, 3, N'Ir al doctor', N'a las 3:00PM', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (5, 3, N'Recoger un paquete', N'a las 7:00AM', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (6, 4, N'Cita ', N'a las 5:00PM', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (7, 4, N'Visitar a mi abuela', N'a las 8:00PM', N'Pendiente')
INSERT [dbo].[tarea] ([Id], [Id_carpeta], [Nom_tarea], [Descripcion], [Estado]) VALUES (8, 2, N'sacar la basura', N'Sacar la basura antes de que se vaya el camion', N'En proceso')
SET IDENTITY_INSERT [dbo].[tarea] OFF
GO
ALTER TABLE [dbo].[tarea]  WITH CHECK ADD  CONSTRAINT [fk_tarea] FOREIGN KEY([Id_carpeta])
REFERENCES [dbo].[carpeta] ([Id])
GO
ALTER TABLE [dbo].[tarea] CHECK CONSTRAINT [fk_tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_CARP_EST]    Script Date: 11/09/2021 20:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CARP_EST]
@idCarpeta as int,
@estado as varchar(20)
AS
select tarea.Id,carpeta.Nom_carpeta,tarea.Nom_tarea,tarea.Descripcion,tarea.Estado from tarea join carpeta on tarea.Id_carpeta = carpeta.Id where carpeta.Id=@idCarpeta AND tarea.Estado=@estado;
GO
/****** Object:  StoredProcedure [dbo].[SP_CARPETA]    Script Date: 11/09/2021 20:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CARPETA]
@idCarpeta as int
AS
select * from carpeta where Id=@idCarpeta; 
GO
USE [master]
GO
ALTER DATABASE [tareas] SET  READ_WRITE 
GO
