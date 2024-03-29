USE [master]
GO
/****** Object:  Database [Persistencia]    Script Date: 25/2/2024 14:51:50 ******/
CREATE DATABASE [Persistencia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Persistencia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Persistencia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Persistencia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Persistencia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Persistencia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Persistencia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Persistencia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Persistencia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Persistencia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Persistencia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Persistencia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Persistencia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Persistencia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Persistencia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Persistencia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Persistencia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Persistencia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Persistencia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Persistencia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Persistencia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Persistencia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Persistencia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Persistencia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Persistencia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Persistencia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Persistencia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Persistencia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Persistencia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Persistencia] SET RECOVERY FULL 
GO
ALTER DATABASE [Persistencia] SET  MULTI_USER 
GO
ALTER DATABASE [Persistencia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Persistencia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Persistencia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Persistencia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Persistencia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Persistencia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Persistencia', N'ON'
GO
ALTER DATABASE [Persistencia] SET QUERY_STORE = ON
GO
ALTER DATABASE [Persistencia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Persistencia]
GO
/****** Object:  Table [dbo].[tbl_cuenta]    Script Date: 25/2/2024 14:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cuenta](
	[NumeroCuenta] [int] NOT NULL,
	[saldo] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_transacciones]    Script Date: 25/2/2024 14:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_transacciones](
	[id_transacciones] [int] NOT NULL,
	[CuentaOrigen] [int] NOT NULL,
	[CuentaDestino] [int] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 25/2/2024 14:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name_user] [varchar](50) NOT NULL,
	[last_name_user] [varchar](50) NOT NULL,
	[addres_user] [varchar](50) NOT NULL,
	[status_user] [int] NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_user]    Script Date: 25/2/2024 14:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[SP_Insert_user]
	@nameUSer varchar(50),
	@lastUser varchar(50),
	@addressUser varchar(50)
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON (para no registrar el numero de inserciones realizadas) added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_user(
		name_user, 
		last_name_user,
		addres_user, 
		status_user)
	VALUES(
		@nameUSer, 
		@lastUser, 
		@addressUser,
		1)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH
GO
USE [master]
GO
ALTER DATABASE [Persistencia] SET  READ_WRITE 
GO
