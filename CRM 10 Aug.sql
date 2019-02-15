/****** Object:  Database [CRMDB]    Script Date: 10-Aug-16 12:31:18 AM ******/
CREATE DATABASE [CRMDB] ON  PRIMARY 
( NAME = N'CRMDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CRMDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CRMDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CRMDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CRMDB] SET  MULTI_USER 
GO
ALTER DATABASE [CRMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRMDB] SET DB_CHAINING OFF 
GO
/****** Object:  Table [dbo].[Complaints]    Script Date: 10-Aug-16 12:31:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComplainTypeId] [int] NOT NULL,
	[ComplainNumber] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Complaints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComplainType]    Script Date: 10-Aug-16 12:31:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplainType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComplainName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ComplainType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 10-Aug-16 12:31:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
