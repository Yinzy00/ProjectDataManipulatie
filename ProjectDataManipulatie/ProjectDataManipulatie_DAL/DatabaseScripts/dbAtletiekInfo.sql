USE [master]
GO
/****** Object:  Database [dbAtletiekInfo]    Script Date: 25/05/2021 13:20:56 ******/
CREATE DATABASE [dbAtletiekInfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbAtletiekInfo', FILENAME = N'C:\Users\yarim\dbAtletiekInfo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbAtletiekInfo_log', FILENAME = N'C:\Users\yarim\dbAtletiekInfo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbAtletiekInfo] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbAtletiekInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbAtletiekInfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbAtletiekInfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbAtletiekInfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbAtletiekInfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbAtletiekInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbAtletiekInfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbAtletiekInfo] SET  MULTI_USER 
GO
ALTER DATABASE [dbAtletiekInfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbAtletiekInfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbAtletiekInfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbAtletiekInfo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbAtletiekInfo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbAtletiekInfo] SET QUERY_STORE = OFF
GO
USE [dbAtletiekInfo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [dbAtletiekInfo]
GO
/****** Object:  Schema [AtletiekInfo]    Script Date: 25/05/2021 13:20:56 ******/
CREATE SCHEMA [AtletiekInfo]
GO
/****** Object:  Table [AtletiekInfo].[tblCategorie]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblCategorie](
	[Id] [int] NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[leeftijdBegin] [int] NOT NULL,
	[leeftijdEinde] [int] NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblClub]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblClub](
	[Id] [int] NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[website] [varchar](50) NOT NULL,
	[provincieId] [int] NOT NULL,
	[Locatie] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblPersoon]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblPersoon](
	[Id] [int] NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[voornaam] [varchar](50) NOT NULL,
	[geslacht] [varchar](50) NOT NULL,
	[geboorteDatum] [date] NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Persoon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblPersoonClub]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblPersoonClub](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[persoonId] [int] NOT NULL,
	[borstNummer] [varchar](5) NOT NULL,
	[begin] [date] NOT NULL,
	[eind] [date] NULL,
	[clubId] [int] NOT NULL,
 CONSTRAINT [PK_PersoonClub] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblProef]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblProef](
	[Id] [int] NOT NULL,
	[naam] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proef] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblProefCategorie]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblProefCategorie](
	[Id] [int] NOT NULL,
	[proefId] [int] NOT NULL,
	[categorieId] [int] NOT NULL,
	[geslacht] [varchar](50) NOT NULL,
	[info] [varchar](50) NULL,
 CONSTRAINT [PK_ProefCategorie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblProvincies]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblProvincies](
	[Id] [int] NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[gewest] [bit] NOT NULL,
 CONSTRAINT [PK_Provincie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblRelaties]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblRelaties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersoonEenId] [int] NOT NULL,
	[PersoonTweeId] [int] NOT NULL,
	[Geaccepteerd] [bit] NOT NULL,
 CONSTRAINT [PK_Relatie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblResultaat]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblResultaat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[wedstrijdProefId] [int] NOT NULL,
	[persoonId] [int] NOT NULL,
	[plaats] [varchar](50) NOT NULL,
	[prestatie] [varchar](50) NOT NULL,
	[wind] [float] NOT NULL,
 CONSTRAINT [PK_Resultaat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblWedstijdProef]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblWedstijdProef](
	[Id] [int] NOT NULL,
	[proefCategorieId] [int] NOT NULL,
	[wedsrijdId] [int] NOT NULL,
 CONSTRAINT [PK_WedstrijdProef] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AtletiekInfo].[tblWedstrijd]    Script Date: 25/05/2021 13:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AtletiekInfo].[tblWedstrijd](
	[Id] [int] NOT NULL,
	[clubId] [int] NOT NULL,
	[datum] [date] NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[plaats] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Wedstrijd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (1, N'Kangoeroes', 0, 7)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (2, N'Benjamins', 8, 9)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (3, N'Pupillen', 10, 11)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (4, N'Miniemen', 12, 13)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (5, N'Cadetten', 14, 15)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (6, N'Scholieren', 16, 17)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (7, N'Junioren', 18, 19)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (8, N'Senioren', 20, 34)
INSERT [AtletiekInfo].[tblCategorie] ([Id], [naam], [leeftijdBegin], [leeftijdEinde]) VALUES (9, N'Masters', 35, 1000)
GO
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (1, N'RESC', N'http://resc.lbfa.be/', 6, N'Av. de Marathon - bruxelles - belgium', N'resc@lbfa.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (2, N'RESC', N'http://resc.lbfa.be/', 1, N'Industriepark 3, 2235 Hulshout,belgium', N'huls@atletiek.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (3, N'LOOI', N'http://www.looise-av.be/', 2, N'Sportlaan, 3980 Tessenderlo ,belgium', N'resc@lbfa.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (4, N'ACBR', N'http://www.acbreak.be/', 1, N'park,2930 Brasschaat,belgium', N'acbr@atletiek.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (5, N'SGOL', N'http://www.sgola.be/', 1, N'Vremdesesteenweg 224, 2530 Boechout', N'sgol@atletiek.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (6, N'LYRA', N'http://www.aclyra.com/', 1, N'Aarschotsesteenweg ,2500 lier,belgium', N'lyra@atletiek.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (7, N'RCG', N'http://www.krcgentatletiek.be/', 4, N'Zuiderlaan 14, 9000 gent, belgium', N'rcg@atletiek.be')
INSERT [AtletiekInfo].[tblClub] ([Id], [naam], [website], [provincieId], [Locatie], [email]) VALUES (8, N'CABW', N'http://cabw.lbfa.be/', 6, N'Av. Jules Mathieu - Nivelles - Belgium', N'cabw@lbfa.be')
GO
INSERT [AtletiekInfo].[tblPersoon] ([Id], [naam], [voornaam], [geslacht], [geboorteDatum], [email], [password]) VALUES (1, N'Peeters', N'Jef', N'Man', CAST(N'2000-06-04' AS Date), N'jef@mail.be', N'wachtwoord')
INSERT [AtletiekInfo].[tblPersoon] ([Id], [naam], [voornaam], [geslacht], [geboorteDatum], [email], [password]) VALUES (2, N'Peeters', N'Bart', N'Man', CAST(N'2005-07-20' AS Date), N'bart@mail.be', N'wachtwoord')
INSERT [AtletiekInfo].[tblPersoon] ([Id], [naam], [voornaam], [geslacht], [geboorteDatum], [email], [password]) VALUES (3, N'Smets', N'Jonas', N'Man', CAST(N'2003-02-09' AS Date), N'jonas@mail.be', N'wachtwoord')
INSERT [AtletiekInfo].[tblPersoon] ([Id], [naam], [voornaam], [geslacht], [geboorteDatum], [email], [password]) VALUES (4, N'Mandarijn', N'Jossefien', N'Vrouw', CAST(N'2004-12-04' AS Date), NULL, NULL)
INSERT [AtletiekInfo].[tblPersoon] ([Id], [naam], [voornaam], [geslacht], [geboorteDatum], [email], [password]) VALUES (5, N'Moens', N'Marianne', N'Vrouw', CAST(N'1998-06-04' AS Date), NULL, NULL)
INSERT [AtletiekInfo].[tblPersoon] ([Id], [naam], [voornaam], [geslacht], [geboorteDatum], [email], [password]) VALUES (6, N'Corsus', N'Bart', N'Man', CAST(N'2000-10-06' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [AtletiekInfo].[tblPersoonClub] ON 

INSERT [AtletiekInfo].[tblPersoonClub] ([Id], [persoonId], [borstNummer], [begin], [eind], [clubId]) VALUES (1, 1, N'123', CAST(N'2021-01-01' AS Date), CAST(N'1900-01-01' AS Date), 1)
INSERT [AtletiekInfo].[tblPersoonClub] ([Id], [persoonId], [borstNummer], [begin], [eind], [clubId]) VALUES (2, 2, N'345', CAST(N'2021-01-01' AS Date), CAST(N'1900-01-01' AS Date), 2)
INSERT [AtletiekInfo].[tblPersoonClub] ([Id], [persoonId], [borstNummer], [begin], [eind], [clubId]) VALUES (3, 3, N'678', CAST(N'2021-01-01' AS Date), CAST(N'1900-01-01' AS Date), 3)
INSERT [AtletiekInfo].[tblPersoonClub] ([Id], [persoonId], [borstNummer], [begin], [eind], [clubId]) VALUES (4, 4, N'911', CAST(N'2021-01-01' AS Date), CAST(N'1900-01-01' AS Date), 4)
INSERT [AtletiekInfo].[tblPersoonClub] ([Id], [persoonId], [borstNummer], [begin], [eind], [clubId]) VALUES (5, 5, N'121', CAST(N'2021-01-01' AS Date), CAST(N'1900-01-01' AS Date), 5)
INSERT [AtletiekInfo].[tblPersoonClub] ([Id], [persoonId], [borstNummer], [begin], [eind], [clubId]) VALUES (6, 6, N'141', CAST(N'2021-01-01' AS Date), CAST(N'2020-04-02' AS Date), 6)
SET IDENTITY_INSERT [AtletiekInfo].[tblPersoonClub] OFF
GO
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (1, N'Verspringen')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (2, N'hoogspringen')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (3, N'Speerwerpen')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (4, N'kogel')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (5, N'discus')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (6, N'polsstok')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (7, N'80m')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (8, N'80m horden')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (9, N'100m')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (10, N'100m horden')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (11, N'200m')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (12, N'200m horden')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (13, N'400m')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (14, N'400m horden')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (15, N'800m')
INSERT [AtletiekInfo].[tblProef] ([Id], [naam]) VALUES (16, N'1000m')
GO
INSERT [AtletiekInfo].[tblProefCategorie] ([Id], [proefId], [categorieId], [geslacht], [info]) VALUES (1, 1, 2, N'Man', NULL)
INSERT [AtletiekInfo].[tblProefCategorie] ([Id], [proefId], [categorieId], [geslacht], [info]) VALUES (2, 2, 6, N'Man', NULL)
INSERT [AtletiekInfo].[tblProefCategorie] ([Id], [proefId], [categorieId], [geslacht], [info]) VALUES (3, 3, 5, N'Man', NULL)
INSERT [AtletiekInfo].[tblProefCategorie] ([Id], [proefId], [categorieId], [geslacht], [info]) VALUES (4, 4, 4, N'Man', NULL)
INSERT [AtletiekInfo].[tblProefCategorie] ([Id], [proefId], [categorieId], [geslacht], [info]) VALUES (5, 2, 3, N'Man', NULL)
INSERT [AtletiekInfo].[tblProefCategorie] ([Id], [proefId], [categorieId], [geslacht], [info]) VALUES (6, 1, 3, N'Man', NULL)
GO
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (1, N'Antwerpen', 0)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (2, N'Limburg', 0)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (3, N'Vlaams Brabant', 0)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (4, N'Oost Vlaanderen', 0)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (5, N'West Vlaanderen', 0)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (6, N'Waals Brabant', 1)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (7, N'Luik', 1)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (8, N'Namen', 1)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (9, N'Luxenburg', 1)
INSERT [AtletiekInfo].[tblProvincies] ([Id], [naam], [gewest]) VALUES (10, N'Henegouwen', 1)
GO
SET IDENTITY_INSERT [AtletiekInfo].[tblResultaat] ON 

INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (1, 1, 1, N'1', N'6,60', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (2, 1, 2, N'2', N'6,40', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (3, 1, 3, N'3', N'5,90', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (4, 1, 4, N'4', N'5,80', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (5, 4, 5, N'1', N'13,60', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (6, 4, 6, N'2', N'11,40', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (7, 4, 1, N'3', N'10,30', 1)
INSERT [AtletiekInfo].[tblResultaat] ([Id], [wedstrijdProefId], [persoonId], [plaats], [prestatie], [wind]) VALUES (8, 4, 2, N'4', N'8,10', 1)
SET IDENTITY_INSERT [AtletiekInfo].[tblResultaat] OFF
GO
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (1, 1, 1)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (2, 2, 1)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (3, 3, 1)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (4, 4, 1)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (5, 1, 2)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (6, 2, 2)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (7, 3, 2)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (8, 4, 2)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (9, 5, 2)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (10, 1, 3)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (11, 2, 3)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (12, 3, 3)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (13, 4, 3)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (14, 1, 4)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (15, 2, 4)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (16, 3, 4)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (17, 4, 4)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (18, 1, 5)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (19, 2, 5)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (20, 3, 5)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (21, 4, 5)
INSERT [AtletiekInfo].[tblWedstijdProef] ([Id], [proefCategorieId], [wedsrijdId]) VALUES (22, 5, 5)
GO
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (1, 6, CAST(N'2020-06-05' AS Date), N'Wedstrijd 1', N'Lier')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (2, 3, CAST(N'2020-06-05' AS Date), N'Wedstrijd 2', N'Tessenderlo')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (3, 4, CAST(N'2020-06-05' AS Date), N'Wedstrijd 3', N'Brasschaat')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (4, 6, CAST(N'2020-06-05' AS Date), N'Wedstrijd 4', N'Lier')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (5, 2, CAST(N'2020-06-05' AS Date), N'Wedstrijd 5', N'Hulshout')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (6, 7, CAST(N'2020-06-05' AS Date), N'Wedstrijd 6', N'Gent')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (7, 8, CAST(N'2020-06-05' AS Date), N'Wedstrijd 7', N'Nivelles')
INSERT [AtletiekInfo].[tblWedstrijd] ([Id], [clubId], [datum], [naam], [plaats]) VALUES (8, 1, CAST(N'2020-06-05' AS Date), N'Wedstrijd 8', N'Bruxelles')
GO
ALTER TABLE [AtletiekInfo].[tblRelaties] ADD  DEFAULT ((0)) FOR [Geaccepteerd]
GO
ALTER TABLE [AtletiekInfo].[tblClub]  WITH CHECK ADD  CONSTRAINT [FK_ProvincieId] FOREIGN KEY([provincieId])
REFERENCES [AtletiekInfo].[tblProvincies] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblClub] CHECK CONSTRAINT [FK_ProvincieId]
GO
ALTER TABLE [AtletiekInfo].[tblPersoonClub]  WITH CHECK ADD  CONSTRAINT [FK_PersoonClubClubId] FOREIGN KEY([clubId])
REFERENCES [AtletiekInfo].[tblClub] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblPersoonClub] CHECK CONSTRAINT [FK_PersoonClubClubId]
GO
ALTER TABLE [AtletiekInfo].[tblPersoonClub]  WITH CHECK ADD  CONSTRAINT [FK_PersoonClubPersoonId] FOREIGN KEY([persoonId])
REFERENCES [AtletiekInfo].[tblPersoon] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblPersoonClub] CHECK CONSTRAINT [FK_PersoonClubPersoonId]
GO
ALTER TABLE [AtletiekInfo].[tblProefCategorie]  WITH CHECK ADD  CONSTRAINT [FK_ProefCategorieCategorie] FOREIGN KEY([categorieId])
REFERENCES [AtletiekInfo].[tblCategorie] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblProefCategorie] CHECK CONSTRAINT [FK_ProefCategorieCategorie]
GO
ALTER TABLE [AtletiekInfo].[tblProefCategorie]  WITH CHECK ADD  CONSTRAINT [FK_ProefCategorieProef] FOREIGN KEY([proefId])
REFERENCES [AtletiekInfo].[tblProef] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblProefCategorie] CHECK CONSTRAINT [FK_ProefCategorieProef]
GO
ALTER TABLE [AtletiekInfo].[tblRelaties]  WITH CHECK ADD  CONSTRAINT [FK_RelatiePersoonEen] FOREIGN KEY([PersoonEenId])
REFERENCES [AtletiekInfo].[tblPersoon] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblRelaties] CHECK CONSTRAINT [FK_RelatiePersoonEen]
GO
ALTER TABLE [AtletiekInfo].[tblRelaties]  WITH CHECK ADD  CONSTRAINT [FK_RelatiePersoonTwee] FOREIGN KEY([PersoonTweeId])
REFERENCES [AtletiekInfo].[tblPersoon] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblRelaties] CHECK CONSTRAINT [FK_RelatiePersoonTwee]
GO
ALTER TABLE [AtletiekInfo].[tblResultaat]  WITH CHECK ADD  CONSTRAINT [FK_ResultaatPersoon] FOREIGN KEY([persoonId])
REFERENCES [AtletiekInfo].[tblPersoon] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblResultaat] CHECK CONSTRAINT [FK_ResultaatPersoon]
GO
ALTER TABLE [AtletiekInfo].[tblResultaat]  WITH CHECK ADD  CONSTRAINT [FK_ResultaatWijdstrijdProefId] FOREIGN KEY([wedstrijdProefId])
REFERENCES [AtletiekInfo].[tblWedstijdProef] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblResultaat] CHECK CONSTRAINT [FK_ResultaatWijdstrijdProefId]
GO
ALTER TABLE [AtletiekInfo].[tblWedstijdProef]  WITH CHECK ADD  CONSTRAINT [FK_WedstrijdProefProefCategorie] FOREIGN KEY([proefCategorieId])
REFERENCES [AtletiekInfo].[tblProefCategorie] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblWedstijdProef] CHECK CONSTRAINT [FK_WedstrijdProefProefCategorie]
GO
ALTER TABLE [AtletiekInfo].[tblWedstijdProef]  WITH CHECK ADD  CONSTRAINT [FK_WedstrijdProefWedstrijd] FOREIGN KEY([wedsrijdId])
REFERENCES [AtletiekInfo].[tblWedstrijd] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [AtletiekInfo].[tblWedstijdProef] CHECK CONSTRAINT [FK_WedstrijdProefWedstrijd]
GO
ALTER TABLE [AtletiekInfo].[tblWedstrijd]  WITH CHECK ADD  CONSTRAINT [FK_WedstrijdClub] FOREIGN KEY([clubId])
REFERENCES [AtletiekInfo].[tblClub] ([Id])
GO
ALTER TABLE [AtletiekInfo].[tblWedstrijd] CHECK CONSTRAINT [FK_WedstrijdClub]
GO
USE [master]
GO
ALTER DATABASE [dbAtletiekInfo] SET  READ_WRITE 
GO
