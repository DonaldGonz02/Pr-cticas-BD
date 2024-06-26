USE [master]
GO
/****** Object:  Database [LoginTrans]    Script Date: 21/4/2024 16:10:54 ******/
CREATE DATABASE [LoginTrans]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LoginTrans', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LoginTrans.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LoginTrans_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LoginTrans_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LoginTrans] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoginTrans].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoginTrans] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoginTrans] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoginTrans] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoginTrans] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoginTrans] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoginTrans] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoginTrans] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoginTrans] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoginTrans] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoginTrans] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoginTrans] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoginTrans] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoginTrans] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoginTrans] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoginTrans] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LoginTrans] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoginTrans] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoginTrans] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoginTrans] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoginTrans] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoginTrans] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoginTrans] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoginTrans] SET RECOVERY FULL 
GO
ALTER DATABASE [LoginTrans] SET  MULTI_USER 
GO
ALTER DATABASE [LoginTrans] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoginTrans] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LoginTrans] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LoginTrans] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LoginTrans] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LoginTrans] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LoginTrans', N'ON'
GO
ALTER DATABASE [LoginTrans] SET QUERY_STORE = ON
GO
ALTER DATABASE [LoginTrans] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LoginTrans]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 21/4/2024 16:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[ID_Asignacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Conductor] [int] NULL,
	[ID_Vehiculo] [int] NULL,
	[ID_Paquete] [int] NULL,
	[Fecha_Asignación] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 21/4/2024 16:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[ID_Conductor] [int] NOT NULL,
	[Nombre_Conductor] [varchar](50) NULL,
	[Disponibilidad_Conductor] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Conductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paquete]    Script Date: 21/4/2024 16:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquete](
	[ID_Paquete] [int] NOT NULL,
	[Peso_Paquete] [decimal](10, 2) NULL,
	[Urgencia_Paquete] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 21/4/2024 16:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[ID_Vehiculo] [int] NOT NULL,
	[Tipo_Vehiculo] [varchar](50) NULL,
	[Capacidad_Carga_Vehiculo] [decimal](10, 2) NULL,
	[Disponibilidad_Vehiculo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vehiculo] ADD  DEFAULT ((1)) FOR [Disponibilidad_Vehiculo]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([ID_Conductor])
REFERENCES [dbo].[Conductor] ([ID_Conductor])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([ID_Paquete])
REFERENCES [dbo].[Paquete] ([ID_Paquete])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([ID_Vehiculo])
REFERENCES [dbo].[Vehiculo] ([ID_Vehiculo])
GO
/****** Object:  StoredProcedure [dbo].[InsertarAsignacion]    Script Date: 21/4/2024 16:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarAsignacion]
    @ID_Conductor INT,
    @ID_Vehiculo INT,
    @ID_Paquete INT,
    @Fecha_Asignación DATE
AS
BEGIN
    -- Verificar si el conductor está disponible
    DECLARE @Disponibilidad BIT;
    SELECT @Disponibilidad = Disponibilidad_Conductor FROM Conductor WHERE ID_Conductor = @ID_Conductor;

    -- Verificar la capacidad de carga del vehículo
    DECLARE @CapacidadCarga DECIMAL(10, 2);
    SELECT @CapacidadCarga = Capacidad_Carga_Vehiculo FROM Vehiculo WHERE ID_Vehiculo = @ID_Vehiculo;

    -- Verificar el peso del paquete
    DECLARE @PesoPaquete DECIMAL(10, 2);
    SELECT @PesoPaquete = Peso_Paquete FROM Paquete WHERE ID_Paquete = @ID_Paquete;

    IF @Disponibilidad = 1 AND @PesoPaquete <= @CapacidadCarga
    BEGIN
        -- Si el conductor está disponible y el peso del paquete no excede la capacidad de carga del vehículo, insertar la asignación
        INSERT INTO Asignacion (ID_Conductor, ID_Vehiculo, ID_Paquete, Fecha_Asignación)
        VALUES (@ID_Conductor, @ID_Vehiculo, @ID_Paquete, GETDATE());
        
        -- Cambiar la disponibilidad del conductor a 'no disponible'
        UPDATE Conductor
        SET Disponibilidad_Conductor = 0
        WHERE ID_Conductor = @ID_Conductor;
        
        PRINT 'Asignación insertada exitosamente. El conductor ahora está marcado como no disponible.';
    END
    ELSE
    BEGIN
        -- Si el conductor no está disponible o el peso del paquete excede la capacidad de carga del vehículo, mostrar un mensaje
        PRINT 'No se pudo insertar la asignación. Por favor, verifica la disponibilidad del conductor y la capacidad de carga del vehículo.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[ReportAsignacion]    Script Date: 21/4/2024 16:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportAsignacion]
AS
BEGIN
    SELECT 
        c.ID_Conductor, 
        c.Nombre_Conductor, 
        v.Tipo_Vehiculo, 
        COUNT(a.ID_Asignacion) AS Cantidad_Asignaciones
    FROM 
        Asignacion a
    INNER JOIN 
        Conductor c ON a.ID_Conductor = c.ID_Conductor
    INNER JOIN 
        Vehiculo v ON a.ID_Vehiculo = v.ID_Vehiculo
    GROUP BY 
        c.ID_Conductor, 
        c.Nombre_Conductor, 
        v.Tipo_Vehiculo
    ORDER BY 
        Cantidad_Asignaciones DESC;
END;
GO
USE [master]
GO
ALTER DATABASE [LoginTrans] SET  READ_WRITE 
GO
