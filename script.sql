USE [master]
GO
/****** Object:  Database [DatabaseExample]    Script Date: 27.5.2018 17:20:36 ******/
CREATE DATABASE [DatabaseExample]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabaseExample', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DatabaseExample.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DatabaseExample_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DatabaseExample_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DatabaseExample] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseExample].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseExample] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseExample] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseExample] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseExample] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseExample] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseExample] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabaseExample] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseExample] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseExample] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseExample] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseExample] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseExample] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseExample] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseExample] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseExample] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabaseExample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseExample] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseExample] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseExample] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseExample] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseExample] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseExample] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseExample] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatabaseExample] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseExample] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseExample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseExample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseExample] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DatabaseExample] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DatabaseExample]
GO
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 27.5.2018 17:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTable](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](10) NOT NULL,
	[CategoryStoreNo] [int] NULL,
 CONSTRAINT [PK_CategoryTable] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategoryTable]    Script Date: 27.5.2018 17:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryTable](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTable]    Script Date: 27.5.2018 17:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTable](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductDate] [date] NULL,
	[ProductCountry] [char](10) NULL,
	[ProductPrice] [money] NULL,
 CONSTRAINT [PK_ProductTable] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ProductCategoryTable]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategoryTable_CategoryTable] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryTable] ([CategoryId])
GO
ALTER TABLE [dbo].[ProductCategoryTable] CHECK CONSTRAINT [FK_ProductCategoryTable_CategoryTable]
GO
ALTER TABLE [dbo].[ProductCategoryTable]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategoryTable_ProductTable] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductTable] ([ProductId])
GO
ALTER TABLE [dbo].[ProductCategoryTable] CHECK CONSTRAINT [FK_ProductCategoryTable_ProductTable]
GO
USE [master]
GO
ALTER DATABASE [DatabaseExample] SET  READ_WRITE 
GO
