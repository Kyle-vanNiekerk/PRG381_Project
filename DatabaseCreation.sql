USE [DeliciousCateringDB]
GO
ALTER TABLE [dbo].[Event] DROP CONSTRAINT [FK_Event_Venue]
GO
ALTER TABLE [dbo].[Event] DROP CONSTRAINT [FK_Event_Food]
GO
ALTER TABLE [dbo].[Event] DROP CONSTRAINT [FK_Event_Client]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 2021/02/28 19:52:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venue]') AND type in (N'U'))
DROP TABLE [dbo].[Venue]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 2021/02/28 19:52:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Food]') AND type in (N'U'))
DROP TABLE [dbo].[Food]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2021/02/28 19:52:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
DROP TABLE [dbo].[Event]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2021/02/28 19:52:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Client]') AND type in (N'U'))
DROP TABLE [dbo].[Client]
GO
USE [master]
GO
/****** Object:  Database [DeliciousCateringDB]    Script Date: 2021/02/28 19:52:50 ******/
DROP DATABASE [DeliciousCateringDB]
GO
/****** Object:  Database [DeliciousCateringDB]    Script Date: 2021/02/28 19:52:50 ******/
CREATE DATABASE [DeliciousCateringDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeliciousCateringDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DeliciousCateringDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeliciousCateringDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DeliciousCateringDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DeliciousCateringDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeliciousCateringDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeliciousCateringDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeliciousCateringDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeliciousCateringDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeliciousCateringDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeliciousCateringDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DeliciousCateringDB] SET  MULTI_USER 
GO
ALTER DATABASE [DeliciousCateringDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeliciousCateringDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeliciousCateringDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeliciousCateringDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeliciousCateringDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DeliciousCateringDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DeliciousCateringDB] SET QUERY_STORE = OFF
GO
USE [DeliciousCateringDB]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2021/02/28 19:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2021/02/28 19:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [nchar](10) NOT NULL,
	[ClientID] [nchar](10) NOT NULL,
	[VenueID] [nchar](10) NOT NULL,
	[FoodID] [nchar](10) NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [money] NOT NULL,
	[Decor] [varchar](50) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 2021/02/28 19:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [nchar](10) NOT NULL,
	[IsAdult] [bit] NOT NULL,
	[Price] [money] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 2021/02/28 19:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[VenueID] [nchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[VenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Client]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Food] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Food]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Venue] FOREIGN KEY([VenueID])
REFERENCES [dbo].[Venue] ([VenueID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Venue]
GO
USE [master]
GO
ALTER DATABASE [DeliciousCateringDB] SET  READ_WRITE 
GO
