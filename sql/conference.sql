USE [master]
GO
/****** Object:  Database [Conference]    Script Date: 10/9/2016 11:15:27 PM ******/
CREATE DATABASE [Conference] ON  PRIMARY 
( NAME = N'Summit2016', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Summit2016.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Summit2016_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Summit2016_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [Conference] SET AUTO_CREATE_STATISTICS ON 
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
/****** Object:  User [cfsummit2016]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE USER [cfsummit2016] FOR LOGIN [cfsummit2016] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'cfsummit2016'
GO
/****** Object:  Schema [Auth]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Auth]
GO
/****** Object:  Schema [Conf]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Conf]
GO
/****** Object:  Schema [Contact]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Contact]
GO
/****** Object:  Schema [Definition]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Definition]
GO
/****** Object:  Schema [Map]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Map]
GO
/****** Object:  Schema [Person]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Session]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Session]
GO
/****** Object:  Schema [Sponser]    Script Date: 10/9/2016 11:15:28 PM ******/
CREATE SCHEMA [Sponser]
GO
/****** Object:  Table [Auth].[Login]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Auth].[Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Createdby] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Auth].[LoginRole]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Auth].[LoginRole](
	[LoginRoleID] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[Createdby] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_LoginRole] PRIMARY KEY CLUSTERED 
(
	[LoginRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Auth].[PersonLogin]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Auth].[PersonLogin](
	[PersonLoginID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[LoginID] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[Createdby] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_PersonLogin] PRIMARY KEY CLUSTERED 
(
	[PersonLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Conf].[Conference]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Conf].[Conference](
	[ConferenceID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Location] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED 
(
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Conf].[Lecture]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Conf].[Lecture](
	[LectureID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Description] [varchar](max) NULL,
	[StratDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Conf].[Sponser]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Conf].[Sponser](
	[SponserID] [int] IDENTITY(1,1) NOT NULL,
	[SponserTypeID] [int] NOT NULL,
	[ConferenceID] [int] NULL,
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
/****** Object:  Table [Contact].[Address]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [Contact].[Person]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contact].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeID] [int] NOT NULL,
	[ConferenceID] [int] NULL,
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
/****** Object:  Table [dbo].[Employee]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [dbo].[Organizer]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [dbo].[Participant]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [dbo].[Speaker]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [Definition].[AddressType]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [Definition].[PersonType]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [Definition].[Role]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Definition].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Decription] [varchar](250) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Definition].[SponserType]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [Map].[LectureSpeaker]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Map].[LectureSpeaker](
	[LectureSpeakerID] [int] IDENTITY(1,1) NOT NULL,
	[LectureID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_SessionSpeaker] PRIMARY KEY CLUSTERED 
(
	[LectureSpeakerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Map].[PersonAddress]    Script Date: 10/9/2016 11:15:28 PM ******/
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
/****** Object:  Table [Map].[PersonLecture]    Script Date: 10/9/2016 11:15:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Map].[PersonLecture](
	[PersonSessionID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[LectureID] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_PersonSession] PRIMARY KEY CLUSTERED 
(
	[PersonSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Auth].[Login] ON 

INSERT [Auth].[Login] ([LoginID], [UserName], [Password], [Createdby], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, N'shirak', N'123', N'dbo', CAST(0x0000A65C00000000 AS DateTime), N'dbo', CAST(0x0000A65C00000000 AS DateTime))
SET IDENTITY_INSERT [Auth].[Login] OFF
SET IDENTITY_INSERT [Auth].[LoginRole] ON 

INSERT [Auth].[LoginRole] ([LoginRoleID], [LoginID], [RoleID], [Description], [Createdby], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, 1, 1, NULL, N'dbo', CAST(0x0000A65C00000000 AS DateTime), N'dbo', CAST(0x0000A65C00000000 AS DateTime))
INSERT [Auth].[LoginRole] ([LoginRoleID], [LoginID], [RoleID], [Description], [Createdby], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, 1, 2, NULL, N'dbo', CAST(0x0000A65C00000000 AS DateTime), N'dbo', CAST(0x0000A65C00000000 AS DateTime))
SET IDENTITY_INSERT [Auth].[LoginRole] OFF
SET IDENTITY_INSERT [Auth].[PersonLogin] ON 

INSERT [Auth].[PersonLogin] ([PersonLoginID], [PersonID], [LoginID], [Description], [IsActive], [Createdby], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, 2, 1, NULL, 1, N'dbo', CAST(0x0000A65C00000000 AS DateTime), N'dbo', CAST(0x0000A65C00000000 AS DateTime))
SET IDENTITY_INSERT [Auth].[PersonLogin] OFF
SET IDENTITY_INSERT [Conf].[Conference] ON 

INSERT [Conf].[Conference] ([ConferenceID], [AddressID], [Name], [StartDate], [EndDate], [Location], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (3, 1, N'CFSummit 2016', CAST(0xF53B0B00 AS Date), CAST(0xF73B0B00 AS Date), N'Las Vegas', 1, N'Shirak', CAST(0x0000A64C00000000 AS DateTime), N'Shirak', CAST(0x0000A64C00000000 AS DateTime))
SET IDENTITY_INSERT [Conf].[Conference] OFF
SET IDENTITY_INSERT [Conf].[Lecture] ON 

INSERT [Conf].[Lecture] ([LectureID], [Title], [Description], [StratDateTime], [EndDateTime], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, N'Smart PDF', NULL, CAST(0x0000A69A00000000 AS DateTime), CAST(0x0000A69A00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime))
INSERT [Conf].[Lecture] ([LectureID], [Title], [Description], [StratDateTime], [EndDateTime], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, N'CF Architect', NULL, CAST(0x0000A69B00000000 AS DateTime), CAST(0x0000A69B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime))
SET IDENTITY_INSERT [Conf].[Lecture] OFF
SET IDENTITY_INSERT [Contact].[Address] ON 

INSERT [Contact].[Address] ([AddressID], [AddressTypeID], [Address1], [address2], [City], [State], [ZipCode], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, 1, N'123 vegas', NULL, N'Las Vegars', N'NV', N'86451', 1, N'Shirak', CAST(0x0000A64C00000000 AS DateTime), N'Shirak', CAST(0x0000A64C00000000 AS DateTime))
INSERT [Contact].[Address] ([AddressID], [AddressTypeID], [Address1], [address2], [City], [State], [ZipCode], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, 2, N'214 Main st', NULL, N'Los Angeles', N'CA', N'91005', 1, N'Shirak', CAST(0x0000A65D00000000 AS DateTime), N'Shirak', CAST(0x0000A65D00000000 AS DateTime))
SET IDENTITY_INSERT [Contact].[Address] OFF
SET IDENTITY_INSERT [Contact].[Person] ON 

INSERT [Contact].[Person] ([PersonID], [PersonTypeID], [ConferenceID], [Name], [Gender], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, 1, 3, N'Shirak Avakian', N'Male', 1, N'Shirak', CAST(0x0000A64B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime))
SET IDENTITY_INSERT [Contact].[Person] OFF
SET IDENTITY_INSERT [Definition].[AddressType] ON 

INSERT [Definition].[AddressType] ([AddressTypeID], [Name], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, N'Mailing', 1, N'Shirak', CAST(0x0000A64C00000000 AS DateTime), N'Shirak', CAST(0x0000A64C00000000 AS DateTime))
INSERT [Definition].[AddressType] ([AddressTypeID], [Name], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, N'Billing', 1, N'Shirak', CAST(0x0000A65D00000000 AS DateTime), N'Shirak', CAST(0x0000A65D00000000 AS DateTime))
SET IDENTITY_INSERT [Definition].[AddressType] OFF
SET IDENTITY_INSERT [Definition].[PersonType] ON 

INSERT [Definition].[PersonType] ([PersonTypeID], [Name], [Description], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, N'Speaker', N'Conference Speaker', 1, N'Shirak', CAST(0x0000A64B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime))
SET IDENTITY_INSERT [Definition].[PersonType] OFF
SET IDENTITY_INSERT [Definition].[Role] ON 

INSERT [Definition].[Role] ([RoleID], [Name], [Decription], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, N'Speaker', NULL, N'dbo', CAST(0x0000A65C00000000 AS DateTime), N'dbo', CAST(0x0000A65C00000000 AS DateTime))
INSERT [Definition].[Role] ([RoleID], [Name], [Decription], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, N'Participant', NULL, N'dbo', CAST(0x0000A65C00000000 AS DateTime), N'dbo', CAST(0x0000A65C00000000 AS DateTime))
SET IDENTITY_INSERT [Definition].[Role] OFF
SET IDENTITY_INSERT [Map].[PersonAddress] ON 

INSERT [Map].[PersonAddress] ([PersonAddressID], [PersonID], [AddressID], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, 2, 1, 1, N'Shirak', CAST(0x0000A67B00000000 AS DateTime), N'Shirak', CAST(0x0000A65D00000000 AS DateTime))
INSERT [Map].[PersonAddress] ([PersonAddressID], [PersonID], [AddressID], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, 2, 2, 1, N'Shirak', CAST(0x0000A67B00000000 AS DateTime), N'Shirak', CAST(0x0000A67B00000000 AS DateTime))
SET IDENTITY_INSERT [Map].[PersonAddress] OFF
SET IDENTITY_INSERT [Map].[PersonLecture] ON 

INSERT [Map].[PersonLecture] ([PersonSessionID], [PersonID], [LectureID], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (2, 2, 1, N'Shirak', CAST(0x0000A64B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime))
INSERT [Map].[PersonLecture] ([PersonSessionID], [PersonID], [LectureID], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (3, 2, 2, N'Shirak', CAST(0x0000A64B00000000 AS DateTime), N'Shirak', CAST(0x0000A64B00000000 AS DateTime))
SET IDENTITY_INSERT [Map].[PersonLecture] OFF
ALTER TABLE [Auth].[LoginRole]  WITH CHECK ADD  CONSTRAINT [FK_LoginRole_Login] FOREIGN KEY([LoginID])
REFERENCES [Auth].[Login] ([LoginID])
GO
ALTER TABLE [Auth].[LoginRole] CHECK CONSTRAINT [FK_LoginRole_Login]
GO
ALTER TABLE [Auth].[LoginRole]  WITH CHECK ADD  CONSTRAINT [FK_LoginRole_Role] FOREIGN KEY([RoleID])
REFERENCES [Definition].[Role] ([RoleID])
GO
ALTER TABLE [Auth].[LoginRole] CHECK CONSTRAINT [FK_LoginRole_Role]
GO
ALTER TABLE [Auth].[PersonLogin]  WITH CHECK ADD  CONSTRAINT [FK_PersonLogin_Login] FOREIGN KEY([LoginID])
REFERENCES [Auth].[Login] ([LoginID])
GO
ALTER TABLE [Auth].[PersonLogin] CHECK CONSTRAINT [FK_PersonLogin_Login]
GO
ALTER TABLE [Auth].[PersonLogin]  WITH CHECK ADD  CONSTRAINT [FK_PersonLogin_Person] FOREIGN KEY([PersonID])
REFERENCES [Contact].[Person] ([PersonID])
GO
ALTER TABLE [Auth].[PersonLogin] CHECK CONSTRAINT [FK_PersonLogin_Person]
GO
ALTER TABLE [Conf].[Conference]  WITH CHECK ADD  CONSTRAINT [FK_Conference_Address] FOREIGN KEY([AddressID])
REFERENCES [Contact].[Address] ([AddressID])
GO
ALTER TABLE [Conf].[Conference] CHECK CONSTRAINT [FK_Conference_Address]
GO
ALTER TABLE [Conf].[Sponser]  WITH CHECK ADD  CONSTRAINT [FK_Sponser_Conference] FOREIGN KEY([ConferenceID])
REFERENCES [Conf].[Conference] ([ConferenceID])
GO
ALTER TABLE [Conf].[Sponser] CHECK CONSTRAINT [FK_Sponser_Conference]
GO
ALTER TABLE [Conf].[Sponser]  WITH CHECK ADD  CONSTRAINT [FK_Sponser_SponserType] FOREIGN KEY([SponserTypeID])
REFERENCES [Definition].[SponserType] ([SponserTypeID])
GO
ALTER TABLE [Conf].[Sponser] CHECK CONSTRAINT [FK_Sponser_SponserType]
GO
ALTER TABLE [Contact].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AddressType] FOREIGN KEY([AddressTypeID])
REFERENCES [Definition].[AddressType] ([AddressTypeID])
GO
ALTER TABLE [Contact].[Address] CHECK CONSTRAINT [FK_Address_AddressType]
GO
ALTER TABLE [Contact].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Conference] FOREIGN KEY([ConferenceID])
REFERENCES [Conf].[Conference] ([ConferenceID])
GO
ALTER TABLE [Contact].[Person] CHECK CONSTRAINT [FK_Person_Conference]
GO
ALTER TABLE [Contact].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PersonType] FOREIGN KEY([PersonTypeID])
REFERENCES [Definition].[PersonType] ([PersonTypeID])
GO
ALTER TABLE [Contact].[Person] CHECK CONSTRAINT [FK_Person_PersonType]
GO
ALTER TABLE [Map].[LectureSpeaker]  WITH CHECK ADD  CONSTRAINT [FK_LectureSpeaker_Lecture] FOREIGN KEY([LectureID])
REFERENCES [Conf].[Lecture] ([LectureID])
GO
ALTER TABLE [Map].[LectureSpeaker] CHECK CONSTRAINT [FK_LectureSpeaker_Lecture]
GO
ALTER TABLE [Map].[LectureSpeaker]  WITH CHECK ADD  CONSTRAINT [FK_LectureSpeaker_Person] FOREIGN KEY([PersonID])
REFERENCES [Contact].[Person] ([PersonID])
GO
ALTER TABLE [Map].[LectureSpeaker] CHECK CONSTRAINT [FK_LectureSpeaker_Person]
GO
ALTER TABLE [Map].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Address] FOREIGN KEY([AddressID])
REFERENCES [Contact].[Address] ([AddressID])
GO
ALTER TABLE [Map].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Address]
GO
ALTER TABLE [Map].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([PersonID])
REFERENCES [Contact].[Person] ([PersonID])
GO
ALTER TABLE [Map].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
ALTER TABLE [Map].[PersonLecture]  WITH CHECK ADD  CONSTRAINT [FK_PersonLecture_Lecture] FOREIGN KEY([LectureID])
REFERENCES [Conf].[Lecture] ([LectureID])
GO
ALTER TABLE [Map].[PersonLecture] CHECK CONSTRAINT [FK_PersonLecture_Lecture]
GO
ALTER TABLE [Map].[PersonLecture]  WITH CHECK ADD  CONSTRAINT [FK_PersonLecture_Person] FOREIGN KEY([PersonID])
REFERENCES [Contact].[Person] ([PersonID])
GO
ALTER TABLE [Map].[PersonLecture] CHECK CONSTRAINT [FK_PersonLecture_Person]
GO
USE [master]
GO
ALTER DATABASE [Conference] SET  READ_WRITE 
GO
