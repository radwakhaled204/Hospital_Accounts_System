USE [master]
GO
/****** Object:  Database [Sample]    Script Date: 12/22/2014 19:09:52 ******/
CREATE DATABASE [Sample] ON  PRIMARY 
( NAME = N'Sample', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Sample.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sample_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Sample_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Sample] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sample].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sample] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Sample] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Sample] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Sample] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Sample] SET ARITHABORT OFF
GO
ALTER DATABASE [Sample] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Sample] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Sample] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Sample] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Sample] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Sample] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Sample] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Sample] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Sample] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Sample] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Sample] SET  ENABLE_BROKER
GO
ALTER DATABASE [Sample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Sample] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Sample] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Sample] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Sample] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Sample] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Sample] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Sample] SET  READ_WRITE
GO
ALTER DATABASE [Sample] SET RECOVERY FULL
GO
ALTER DATABASE [Sample] SET  MULTI_USER
GO
ALTER DATABASE [Sample] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Sample] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sample', N'ON'
GO
USE [Sample]
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 12/22/2014 19:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[State] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] ON
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (1, N'Anoop', N'Sharma', N'Delhi')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (2, N'Gaurav', N'Kapoor', N'Mumbai')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (3, N'Ajit', N'Singh', N'Punjab')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (4, N'Gurmeet', N'Singh', N'Punjab')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (5, N'Ankit', N'Pandey', N'Bihar')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (6, N'Ajay', N'Singh', N'Punjab')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (7, N'Ramesh', N'Kumar', N'U.P.')
INSERT [dbo].[tbl_Employee] ([ID], [FirstName], [LastName], [State]) VALUES (8, N'Suresh', N'Pant', N'Haryana')
SET IDENTITY_INSERT [dbo].[tbl_Employee] OFF
