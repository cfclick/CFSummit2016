USE [master]
GO
/****** Object:  Database [Conference]    Script Date: 7/10/2016 12:26:22 AM ******/
CREATE DATABASE [Conference] ON  PRIMARY 
( NAME = N'Summit2016', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Summit2016.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Summit2016_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Summit2016_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Conference].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Conference] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Conference] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Conference] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Conference] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Conference] SET ARITHABORT OFF 
GO
ALTER DATABASE [Conference] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Conference] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Conference] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Conference] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Conference] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Conference] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Conference] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Conference] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Conference] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Conference] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Conference] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Conference] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Conference] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Conference] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Conference] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Conference] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Conference] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Conference] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Conference] SET  MULTI_USER 
GO
ALTER DATABASE [Conference] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Conference] SET DB_CHAINING OFF 
GO
USE [Conference]
GO
/****** Object:  User [cms2dev]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE USER [cms2dev] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CharlieFrank]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE USER [CharlieFrank] FOR LOGIN [CharlieFrank] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'CharlieFrank'
GO
/****** Object:  Schema [Contact]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE SCHEMA [Contact]
GO
/****** Object:  Schema [Definition]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE SCHEMA [Definition]
GO
/****** Object:  Schema [Map]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE SCHEMA [Map]
GO
/****** Object:  Schema [Person]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Session]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE SCHEMA [Session]
GO
/****** Object:  Schema [Sponser]    Script Date: 7/10/2016 12:26:23 AM ******/
CREATE SCHEMA [Sponser]
GO
/****** Object:  Table [Contact].[Address]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contact].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[Address1] [varchar](150) NOT NULL,
	[address2] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Contact].[Person]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contact].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [nchar](10) NULL,
	[Address1] [varchar](150) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](10) NULL,
	[State] [char](2) NULL,
	[Zipcode] [varchar](10) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[CompanyName] [varchar](150) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organizer]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organizer](
	[OrganizersID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [nchar](10) NULL,
	[Address1] [varchar](150) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](10) NULL,
	[State] [char](2) NULL,
	[Zipcode] [varchar](10) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[CompanyName] [varchar](150) NULL,
 CONSTRAINT [PK_Organizer] PRIMARY KEY CLUSTERED 
(
	[OrganizersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Participant](
	[ParticipantID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [nchar](10) NULL,
	[Address1] [varchar](150) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](10) NULL,
	[State] [char](2) NULL,
	[Zipcode] [varchar](10) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[CompanyName] [varchar](150) NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[ParticipantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Speaker]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Speaker](
	[SpeakerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [nchar](10) NULL,
	[Address1] [varchar](150) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](10) NULL,
	[State] [char](2) NULL,
	[Zipcode] [varchar](10) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[CompanyName] [varchar](150) NULL,
 CONSTRAINT [PK_Speaker] PRIMARY KEY CLUSTERED 
(
	[SpeakerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Definition].[AddressType]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Definition].[AddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Definition].[PersonType]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Definition].[PersonType](
	[PersonTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_PersonType] PRIMARY KEY CLUSTERED 
(
	[PersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Definition].[SponserType]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Definition].[SponserType](
	[SponserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_SponserType] PRIMARY KEY CLUSTERED 
(
	[SponserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Map].[PersonAddress]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Map].[PersonAddress](
	[PersonAddressID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[PersonAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sponser].[Sponser]    Script Date: 7/10/2016 12:26:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sponser].[Sponser](
	[SponserID] [int] IDENTITY(1,1) NOT NULL,
	[SponserTypeID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Sponser] PRIMARY KEY CLUSTERED 
(
	[SponserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Contact].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AddressType] FOREIGN KEY([AddressTypeID])
REFERENCES [Definition].[AddressType] ([AddressTypeID])
GO
ALTER TABLE [Contact].[Address] CHECK CONSTRAINT [FK_Address_AddressType]
GO
ALTER TABLE [Contact].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PersonType] FOREIGN KEY([PersonTypeID])
REFERENCES [Definition].[PersonType] ([PersonTypeID])
GO
ALTER TABLE [Contact].[Person] CHECK CONSTRAINT [FK_Person_PersonType]
GO
ALTER TABLE [Map].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Address] FOREIGN KEY([AddressID])
REFERENCES [Contact].[Address] ([AddressID])
GO
ALTER TABLE [Map].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Address]
GO
ALTER TABLE [Sponser].[Sponser]  WITH CHECK ADD  CONSTRAINT [FK_Sponser_SponserType] FOREIGN KEY([SponserTypeID])
REFERENCES [Definition].[SponserType] ([SponserTypeID])
GO
ALTER TABLE [Sponser].[Sponser] CHECK CONSTRAINT [FK_Sponser_SponserType]
GO
USE [master]
GO
ALTER DATABASE [Conference] SET  READ_WRITE 
GO
