USE [master]
GO
/****** Object:  Database [ProjetoLogin]    Script Date: 20/10/2024 20:05:47 ******/
CREATE DATABASE [ProjetoLogin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjetoLogin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ProjetoLogin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjetoLogin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ProjetoLogin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProjetoLogin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjetoLogin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjetoLogin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjetoLogin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjetoLogin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjetoLogin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjetoLogin] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjetoLogin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjetoLogin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjetoLogin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjetoLogin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjetoLogin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjetoLogin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjetoLogin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjetoLogin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjetoLogin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjetoLogin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjetoLogin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjetoLogin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjetoLogin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjetoLogin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjetoLogin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjetoLogin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjetoLogin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjetoLogin] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjetoLogin] SET  MULTI_USER 
GO
ALTER DATABASE [ProjetoLogin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjetoLogin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjetoLogin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjetoLogin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjetoLogin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjetoLogin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjetoLogin', N'ON'
GO
ALTER DATABASE [ProjetoLogin] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProjetoLogin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProjetoLogin]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[NomeCliente] [varchar](80) NOT NULL,
	[CNPJCliente] [varchar](14) NOT NULL,
	[EnderecoCliente] [varchar](150) NOT NULL,
	[EmailCliente] [varchar](100) NOT NULL,
	[TelefoneCliente] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[IdProdEstoque] [int] NOT NULL,
	[DescProdEstoque] [varchar](255) NULL,
	[IdProduto] [int] NULL,
	[QuantidadeProd] [int] NULL,
	[DataEstoque] [date] NULL,
	[ValorEstoque] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProdEstoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoProduto]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoProduto](
	[IdGrupoProduto] [int] NOT NULL,
	[GrupoProduto] [varchar](50) NOT NULL,
 CONSTRAINT [IdGrupoProduto] PRIMARY KEY CLUSTERED 
(
	[IdGrupoProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logins]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logins](
	[email] [varchar](50) NULL,
	[senha] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[IdProduto] [int] NOT NULL,
	[NomeProduto] [varchar](50) NOT NULL,
	[Valor] [money] NOT NULL,
	[IdGrupoProduto] [int] NOT NULL,
 CONSTRAINT [IdProduto] PRIMARY KEY CLUSTERED 
(
	[IdProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Estoque]  WITH CHECK ADD  CONSTRAINT [FK_IdProduto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produtos] ([IdProduto])
GO
ALTER TABLE [dbo].[Estoque] CHECK CONSTRAINT [FK_IdProduto]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [FK1TBPRODUTO] FOREIGN KEY([IdGrupoProduto])
REFERENCES [dbo].[GrupoProduto] ([IdGrupoProduto])
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [FK1TBPRODUTO]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCliente_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteCliente_SP]
@IdCliente int

AS 
BEGIN 
SET IDENTITY_INSERT dbo.Clientes ON;
DELETE Clientes WHERE IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduto_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteProduto_SP]
@ProdutoID int

AS
BEGIN 
Delete Produtos WHERE IdProduto = @ProdutoID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCliente_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertCliente_SP]
@IdCliente int,
@NomeCliente varchar(80),
@CNPJCliente varchar(14),
@EnderecoCliente varchar(150),
@EmailCliente varchar(100),
@TelefoneCliente varchar(10)

AS 
BEGIN 
SET IDENTITY_INSERT dbo.Clientes ON;
INSERT INTO Clientes (IdCliente, NomeCliente, CNPJCliente, EnderecoCliente, EmailCliente, TelefoneCliente)
VALUES (@IdCliente, @NomeCliente, @CNPJCliente, @EnderecoCliente, @EmailCliente, @TelefoneCliente)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduto_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertProduto_SP]
@ProdutoID int,
@NomeProduto varchar(50),
@ValorProduto money,
@CategoriaProduto int
AS
BEGIN 
INSERT INTO Produtos (IdProduto, NomeProduto, Valor, IdGrupoProduto)
VALUES (@ProdutoID, @NomeProduto, @ValorProduto, @CategoriaProduto)
END
GO
/****** Object:  StoredProcedure [dbo].[ListCliente_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListCliente_SP]
AS 
BEGIN 
SELECT * FROM Clientes
END
GO
/****** Object:  StoredProcedure [dbo].[ListProduto_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListProduto_SP]
AS
BEGIN 
SELECT * FROM Produtos 
END
GO
/****** Object:  StoredProcedure [dbo].[LoadCliente_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadCliente_SP]
@IdCliente int

AS 
BEGIN 
SET IDENTITY_INSERT dbo.Clientes ON;
SELECT * FROM Clientes WHERE IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[LoadProduto_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadProduto_SP]
@ProdutoID int
AS
BEGIN 
SELECT NomeProduto, Valor, IdGrupoProduto FROM Produtos WHERE IdProduto = @ProdutoID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCliente_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateCliente_SP]
@IdCliente int,
@NomeCliente varchar(80),
@CNPJCliente varchar(14),
@EnderecoCliente varchar(150),
@EmailCliente varchar(100),
@TelefoneCliente varchar(10)

AS 
BEGIN 
SET IDENTITY_INSERT dbo.Clientes ON;
UPDATE Clientes SET  NomeCliente = @NomeCliente, CNPJCliente = @CNPJCliente, EnderecoCliente = @EnderecoCliente, EmailCliente = @EmailCliente, TelefoneCliente = @TelefoneCliente WHERE IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduto_SP]    Script Date: 20/10/2024 20:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateProduto_SP]
@ProdutoID int,
@NomeProduto varchar(50),
@ValorProduto money,
@CategoriaProduto int
AS
BEGIN 
UPDATE Produtos SET NomeProduto = @NomeProduto, Valor = @ValorProduto WHERE IdProduto = @ProdutoID
END
GO
USE [master]
GO
ALTER DATABASE [ProjetoLogin] SET  READ_WRITE 
GO