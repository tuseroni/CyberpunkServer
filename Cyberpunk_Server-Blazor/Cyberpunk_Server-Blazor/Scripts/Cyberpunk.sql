USE [master]
GO
/****** Object:  Database [Cyberpunk]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE DATABASE [Cyberpunk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cyberpunk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cyberpunk.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cyberpunk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cyberpunk_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cyberpunk] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cyberpunk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cyberpunk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cyberpunk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cyberpunk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cyberpunk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cyberpunk] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cyberpunk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cyberpunk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cyberpunk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cyberpunk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cyberpunk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cyberpunk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cyberpunk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cyberpunk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cyberpunk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cyberpunk] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cyberpunk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cyberpunk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cyberpunk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cyberpunk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cyberpunk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cyberpunk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cyberpunk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cyberpunk] SET RECOVERY FULL 
GO
ALTER DATABASE [Cyberpunk] SET  MULTI_USER 
GO
ALTER DATABASE [Cyberpunk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cyberpunk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cyberpunk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cyberpunk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cyberpunk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cyberpunk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cyberpunk', N'ON'
GO
ALTER DATABASE [Cyberpunk] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cyberpunk] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cyberpunk]
GO
/****** Object:  User [tuseroni]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE USER [tuseroni] FOR LOGIN [tuseroni] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [tuseroni]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [tuseroni]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AI_ICON]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_ICON](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_AI_ICON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AI_Personality]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AI_Personality](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_AI_Personality] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArmorLocations]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArmorLocations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Computer]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[Memory] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[Int] [int] NOT NULL,
	[NumCPU] [int] NOT NULL,
	[IsPortable] [bit] NOT NULL,
	[IsCyberAvailable] [bit] NOT NULL,
	[BateryHours] [float] NOT NULL,
	[WallStrength] [int] NOT NULL,
	[PriceLow] [float] NOT NULL,
	[PriceHigh] [float] NOT NULL,
	[NumSlots] [int] NOT NULL,
	[Chipslots] [int] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerImprovements]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerImprovements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[ImprovementFor] [nvarchar](255) NULL,
	[ImprovementAmount] [int] NOT NULL,
	[CostLow] [float] NOT NULL,
	[CostHigh] [float] NOT NULL,
	[UnitTypeID] [int] NOT NULL,
	[Description] [text] NULL,
	[Slots] [float] NOT NULL,
 CONSTRAINT [PK__Computer__3213E83F5875AB3E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerPeripherals]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerPeripherals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[CostPerUnitLow] [float] NOT NULL,
	[CostPerUnitHigh] [float] NOT NULL,
	[UnitTypeID] [int] NULL,
	[MU] [int] NULL,
	[Bonus] [int] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK__Computer__3213E83F70F2AEB6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerPeripheralSkillModifiers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerPeripheralSkillModifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[SkillID] [int] NULL,
	[Modifier] [int] NOT NULL,
	[ComputerPeripheralID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComputerPeripheralStatModifiers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerPeripheralStatModifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[StatID] [int] NULL,
	[Modifier] [int] NOT NULL,
	[ComputerPeripheralID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cyberdeck]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cyberdeck](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[Memory] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[WallStrength] [int] NOT NULL,
	[PriceLow] [float] NOT NULL,
	[PriceHigh] [float] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CyberdeckImprovements]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CyberdeckImprovements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[ImprovementFor] [nvarchar](255) NULL,
	[ImprovementAmount] [int] NOT NULL,
	[CostLow] [float] NOT NULL,
	[CostHigh] [float] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CyberdeckOptions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CyberdeckOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[CostPerUinitLow] [float] NOT NULL,
	[CostPerUinitHigh] [float] NOT NULL,
	[UnitTypeID] [int] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK__Cyberdec__3213E83FB0513B2E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CyberdeckOptionsSkillModifiers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CyberdeckOptionsSkillModifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[SkillID] [int] NULL,
	[Modifier] [int] NOT NULL,
	[CyberdeckOptionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CyberdeckOptionsStatModifiers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CyberdeckOptionsStatModifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[StatID] [int] NULL,
	[Modifier] [int] NOT NULL,
	[CyberdeckOptionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cybernetics]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cybernetics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[NumDice] [int] NULL,
	[DiceType] [int] NULL,
	[Bonus] [int] NULL,
	[HL] [int] NULL,
	[Cost] [float] NULL,
	[Type] [int] NULL,
	[SurgType] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CyberneticTypes]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CyberneticTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fortress]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fortress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subgridID] [int] NULL,
	[WallStrength] [int] NULL,
	[Int] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[AI_Personality_ID] [int] NULL,
	[AI_ICON_ID] [int] NULL,
	[isAI] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressCodeGates]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressCodeGates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[WallStrength] [int] NULL,
	[FortressID] [int] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Fortress__3213E83F80A07427] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressCPU]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressCPU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[FortressID] [int] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Fortress__3213E83F5CA03A55] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressMemory]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressMemory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[FortressID] [int] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Fortress__3213E83F67448657] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressPrograms]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressPrograms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NULL,
	[FortressID] [int] NOT NULL,
	[Rezzed] [bit] NOT NULL,
	[Strength] [int] NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Fortress__3213E83FEC6F25CE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressRemotes]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressRemotes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[FortressID] [int] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_FortressRemotes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressSkills]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressSkills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FortressID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[Ranks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FortressWalls]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FortressWalls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[FortressID] [int] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Fortress__3213E83FD3F2801A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetObjType]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetObjType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[SVG] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Handle] [nvarchar](255) NULL,
	[SIN] [nvarchar](255) NULL,
	[IP] [int] NOT NULL,
	[REP] [int] NOT NULL,
	[Humanity] [int] NOT NULL,
	[Dammage] [int] NOT NULL,
	[RoleID] [int] NULL,
	[aspUserID] [nvarchar](450) NULL,
	[xPos] [int] NOT NULL,
	[yPos] [int] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Player__3213E83F4D408B3D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerArmor]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerArmor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SP] [int] NULL,
	[LocationID] [int] NULL,
	[CurrentSP] [int] NULL,
	[Encumberance] [int] NULL,
	[PlayerID] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerComputer]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerComputer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[ComputerID] [int] NULL,
	[PlayerID] [int] NULL,
	[description] [text] NULL,
	[isCyberEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerComputerImprovements]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerComputerImprovements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerComputerID] [int] NULL,
	[ComputerImprovementsID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerComputerOptions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerComputerOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerComputerID] [int] NULL,
	[ComputerPeripheralsID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerComputerPrograms]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerComputerPrograms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NULL,
	[PlayerComputerID] [int] NULL,
	[Rezzed] [bit] NOT NULL,
	[Strength] [int] NOT NULL,
	[Packed] [bit] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__PlayerCo__3213E83F07BDF388] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCyberdeck]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCyberdeck](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[CyberdeckID] [int] NULL,
	[PlayerID] [int] NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCyberdeckImprovements]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCyberdeckImprovements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerCyberdeckID] [int] NULL,
	[CyberdeckImprovementsID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCyberdeckOptions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCyberdeckOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerCyberdeckID] [int] NULL,
	[CyberdeckOptionsID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCyberdeckPrograms]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCyberdeckPrograms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NULL,
	[PlayerCyberdeckID] [int] NULL,
	[Rezzed] [bit] NOT NULL,
	[Strength] [int] NOT NULL,
	[Packed] [bit] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__PlayerCy__3213E83FF21FBDA1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCybernetics]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCybernetics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HL] [int] NULL,
	[Cost] [int] NULL,
	[CyberneticID] [int] NULL,
	[PlayerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerPrograms]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerPrograms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[Rezzed] [bit] NOT NULL,
	[Strength] [int] NULL,
 CONSTRAINT [PK__PlayerPr__3213E83FDA70A252] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerRoles]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerRoleSkills]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerRoleSkills](
	[PlayerRoleID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [PK_PlayerRoleSkills] PRIMARY KEY CLUSTERED 
(
	[PlayerRoleID] ASC,
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerSkill]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerSkill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ranks] [int] NOT NULL,
	[Bonus] [int] NOT NULL,
	[CurrentIP] [int] NOT NULL,
	[PlayerID] [int] NULL,
	[SkillID] [int] NULL,
	[Name] [text] NULL,
	[IsCustom] [bit] NOT NULL,
	[IsChipped] [bit] NOT NULL,
 CONSTRAINT [PK__PlayerSk__3213E83F7CA325CB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerSkillModifiers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerSkillModifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerSkillID] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[amount] [float] NOT NULL,
 CONSTRAINT [PK_PlayerSkillModifiers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerStat]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerStat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StatID] [int] NULL,
	[Base] [int] NULL,
	[Bonus] [int] NULL,
	[Current] [int] NULL,
	[PlayerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerStatModifiers]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerStatModifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerStatID] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[amount] [float] NOT NULL,
 CONSTRAINT [PK_PlayerStatModifiers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerWeapon]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerWeapon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[NumDice] [int] NULL,
	[DiceType] [int] NULL,
	[Bonus] [int] NULL,
	[ROF] [int] NULL,
	[REL] [int] NULL,
	[Type] [int] NULL,
	[Conc] [int] NULL,
	[Shots1] [int] NULL,
	[Shots2] [int] NULL,
	[Range] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[Strength] [int] NOT NULL,
	[ProgramTypeID] [int] NULL,
	[cost] [float] NOT NULL,
	[MU] [int] NOT NULL,
	[Description] [text] NULL,
	[isCustom] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramFunctions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramFunctions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [text] NULL,
	[diff] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramOptions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [text] NULL,
	[diff] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramProgramFunctions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramProgramFunctions](
	[ProgramID] [int] NOT NULL,
	[ProgramFunctionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC,
	[ProgramFunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramProgramOptions]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramProgramOptions](
	[ProgramID] [int] NOT NULL,
	[ProgramOptionsID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC,
	[ProgramOptionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramSubroutines]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramSubroutines](
	[ProgramID] [int] NOT NULL,
	[SubProgramID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC,
	[SubProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramType]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SkillType] [int] NULL,
	[StatID] [int] NULL,
	[Description] [text] NULL,
	[Multiplier] [int] NOT NULL,
	[IsCustom] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillTypes]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stat]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [text] NULL,
	[ABBR] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subgrid]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subgrid](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[width] [int] NOT NULL,
	[height] [int] NOT NULL,
	[Name] [text] NOT NULL,
	[UserID] [nvarchar](450) NULL,
 CONSTRAINT [PK__Subgrid__3213E83F9BCC36A0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurgicalCode]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalCode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Area] [text] NULL,
	[time] [nvarchar](20) NULL,
	[NumDamageDice] [int] NULL,
	[DamageDiceType] [int] NULL,
	[DamageBonus] [int] NULL,
	[SurgicalCost] [int] NULL,
	[DIFF] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeaponConcTypes]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeaponConcTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weapons]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[NumDice] [int] NULL,
	[DiceType] [int] NULL,
	[Bonus] [int] NULL,
	[ROF] [int] NULL,
	[REL] [int] NULL,
	[Type] [int] NULL,
	[Conc] [int] NULL,
	[Shots1] [int] NULL,
	[Shots2] [int] NULL,
	[Range] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeaponTypes]    Script Date: 2/11/2024 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeaponTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'7.0.1')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202211281958244_InitialCreate', N'CyberpunkServer.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDD6EE3B612BE2F70DE41D0554F915AF9E92EF604F616A9939C1374F3837576D1BB052DD18EB012A54A5436C1419FEC5CF491FA0A672851B2C41F89B215DB29165858E4F09BE170480E87C3FCF5BF3FC73F3F8581F58893D48FC8C43E1A1DDA16266EE4F96439B133BAF8F19DFDF3FB7F7C37BEF0C227EB734977C2E8A0254927F603A5F1A9E3A4EE030E513A0A7D3789D26841476E143AC88B9CE3C3C37F3947470E06081BB02C6BFC3123D40F71FE019FD388B838A6190AAE230F07292F879A598E6ADDA010A73172F1C49E3ECF711267E4EB0C2720F7A868615B67818F409A190E16B685088928A220EBE9A714CF681291E52C860214DC3FC718E816284831EFC3E98ADCB43B87C7AC3BCEAA6109E566298DC29E8047275C3F8ED87C2D2DDB95FE408317A069FACC7A9D6B71625F79382FFA1805A00091E1E9344818F1C4BEAE589CA5F10DA6A3B2E1A880BC4C00EE5B947C1DD5110F2CE37607953D1D8F0ED9BF036B9A05344BF084E08C262838B0EEB279E0BBBFE2E7FBE82B269393A3F9E2E4DD9BB7C83B79FB133E7953EF29F415E81A0550749744314E4036BCA8FA6F5B4EB39D2336AC9AD5DA145A015B82A9615BD7E8E903264BFA0093E6F89D6D5DFA4FD82B4BB8717D223ECC246844930C3E6FB22040F30057F54E2B4FF67F0BD7E3376F07E17A831EFD653EF4027F983809CCAB8F38C86BD3073F2EA65763BCBF70B2CB240AD977D3BE8ADA2FB3284B5CD699484B728F9225A64DE9C6CECA788D4C9A410D6FD625EAFE9B369354366F2529EBD03A33A164B1EDD950CAFBB27C8D2DEE2C8E61F072D3621A693338F586351210C0409A742B133A323521025DFB3BAF881721F283019644032EE0912CFC24C4552F7F89C00011E92DF31D4A535811BCFFA0F4A14574F83980E833EC660918EA8CA2307E716E770F11C137593867F6BF3D5E830DCDFDB7E812B9344A2E086BB531DE87C8FD1A65F48278E788E24FD42D01D9E7BD1F9A030C22CE99EBE234BD0463C6DE340287BB04BC22F4E4B8371C5BA476ED924C03E4876A9F44584EBF94A42BBF444D21F9261A32957FD226EA8768E91333514B52BDA80545A7A89CACAFA80CCC4C524EA9173427E894B3A01ACCE3CB476878972F87DD7F9F6FB3CD5BB716D4D438831512FF1B139CC032E6DD214A7142562360B26EECC259C8878F317DF1BD29E7F41905D9D0ACD69A0DF92230FC6CC861F77F36E46242F1A3EF31AFC4E020541203BC11BDFA8CD53DE704C9B63D1D1ADDDC36F3EDAC01BAE97296A691EBE7B3401102E3018CA6FCE0C359DDD18CA2376244043A0686EEB32D0F4AA06FB66854B7E41C079862EBCC2D42845394BAC893D5081DF27A0856EEA80AC1569191A6703F483CC1D271C21A2176084A61A6FA84CAD3C227AE1FA3A0534B424BC32D8CF5BDE221D69CE31813C6B0531326CCD581102640C54718942E0D8D9D9AC5B51BA2C66BD58D79970BBB1A77293EB1159BECF09D3576C9FDB71731CC768D6DC138DB5562228036A8B70B03E567155303100F2EFB66A0C2894963A0DCA5DA8A813635B603036DAAE4D519687144351D7FE1BCBA6FE6D93C286F7F5B6F55D70E6CB3A18F3D33CDC2F78436145AE04436CFF339ABC44F5471380339F9F92CE5AEAE68220C7C86693364B3F277957EA8D30E221A511BE0CAD03A40F975A004244DA81EC295B1BC56E9B817D103B68CBBB5C2F2B55F80ADD9808C5DBF16AD11EA2F4F45E3343A7D543DABAC413272A3C3420D476110E2E2D5ECB88152747159593126BE701F6FB8D6313E182D0AEAF05C354A2A3B33B8964AD3ECD692CA21EBE3926DA425C17DD268A9ECCCE05AE236DAAD248553D0C32DD84845CD2D7CA0C956463AAADDA6AA1B3B45C6142F183B9AD4AAF1358A639F2C6BA956BCC49AF13CAB1F67FD938FC202C37153450E52256DC58946095A62A1165883A4977E92D27344D11CB138CFD40B2532E5DEAA59FE4B96F5ED531EC4721F28A9D96F1EE3555FE237F65BD921E13897D0CB90793579285D6103EAE6164B7F43014A14D1FB69146421D13B59FAD6C51D5EBD7D5122238C1D417EC989923426B9BA4DF51B0D8E3C31061CA8CA8F597FB0F4103A95975E685DE93ACF548F5206AAEA28BAE0D5CE064FE7D0F41E30D15FEC3F5E9D082F33BF78924A1D8017F5C4A8E5394860B53A73D4662A4A1DB359638E28E49BD42185AA1E52D6B34A1A42D62BD6C2D368544D61CE41CE23A9A3CBB5E6C88A8C923AB4A27A0D6C85CC629D39AA22E9A40EACA836C75E65A0880BE91EEF60DA53CC465B5871D8DD6C0FD360BCCCAA38CC1658BBD3AF03D58A7B62F15B7B098C97EFA545694F7C1B595411E7D8CCA23418FA15A87123DE5C805AAFF1F5988D6BEEC622DF76CDAFC7EB67B72F6A1DD2A14F24A9B857873FE19037E6072E834736E209AC20B1AD528DB0C13FA714872346309AFD1E4C031FB3E5BC24B846C45FE09416A91DF6F1E1D1B1F046677FDECB3869EA058A03ABEED14C73CCB690A5451E51E23EA044CE99D8E04DC90A540A475F110F3F4DECFFE6AD4EF3C806FB95171F5857E927E2FF9E41C57D9261EB0F390774981C7B83571D95A07FBC8AE712E62ABFFAED4BD1F4C0BA4D603A9D5A8782A2D719FEE6238A5ED2144D379066EDA715AF77B635DE2B285185D9B2FEF384B94F07799A504AF97D889EFED95734E5F3838D10154F0C86C21B4485BA2704EB60699F0F78F049F3E703FD3AAB7E4EB08E68DAA7043EE90F263E24305F86CA963BDC871487A66D2C49B99E3B13B137CACADCF5DE24E56B6F34D1E59CEC1E7083E65D6FE6A2BCB27CE6C1B64E45BAF260D8BBB4FB17CF51DE97B4E495D3BEDB6CE46D2620B75C2EFDADF28EF720534E91F9B3FBECE26DDB9A2E0ABCE7299AFD7288F7CCD8F836BFFB4CE16D1B9B2E40BCE7C6D62B1F78CF6C6D57FBE78E2DCD780BDD7976AF9CA8A4B9CD514591BBB2778B903B1CFFE7111841E151168F2ED5E9626DA9AE1D0C57247AA6FA3C3591B1347124BE12453BDB7E7DE51B7E6B67394D3B5B4D76671B6FBEFEB7F2E634EDBC353993BBC83B56662DAA72C13BD6B1B654AAD79467DCE849475A7B97CFDA7A35FF9AD28A07514A63F6686E975F4F16F1202A1972EAF4C81A962F8A61EFACFDCD46D8BF537FB982607FC19160B7B16B5634576411959BB7205149224468AE31451E6CA96709F517C8A550CD02D0F9ABF13CA8C7AE41E6D8BB22B7198D330A5DC6E13C6804BC9813D0C63F4F8D6ECA3CBE8DD9573A4417404C9F05EE6FC92F991F7895DC978A9890068279173CDCCBC692B2B0EFF2B942BA89882110575FE514DDE3300E002CBD2533F488D7910DCCEF035E22F7791501D481740F4453EDE3731F2D1314A61C63D51E3EC186BDF0E9FDFF01B5875F2ABA540000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[AI_ICON] ON 

INSERT [dbo].[AI_ICON] ([id], [name], [description]) VALUES (1, N'Human', N': The AI chooses to look like a normal
human, to better interact with others. The
human ICON chosen can vary wildly, depending on the At’s personality, but alt appear as real humans you might meet on the
Street. ')
INSERT [dbo].[AI_ICON] ([id], [name], [description]) VALUES (2, N'Geometric', N' Forget all this anthropomorphology. The AI manifests itself as shapes,
colors and energyfields. Occasionally shapes
are strung together to make a symbol or
other image. ')
INSERT [dbo].[AI_ICON] ([id], [name], [description]) VALUES (3, N'Mythological', N': The AI is interested in human
archetypes and knows that certain types can
cause fear or awe in humans. The AI appears
as a mythological figure; a dragon, demon,
angel, mystic hero or monster, all out of
some type of human mythology. ')
INSERT [dbo].[AI_ICON] ([id], [name], [description]) VALUES (4, N'Voice Only', N'The AI only appears as a voice
emanating from all over it’s Data Fortress.
The voice may be powerful and booming, or
tiny and childlike, depending on personality. ')
INSERT [dbo].[AI_ICON] ([id], [name], [description]) VALUES (5, N'Technic', N'The AI appears as a construct out of
science fiction. This could be a robot or other
metallic warrior, or an assemblage of high
tech shapes.')
INSERT [dbo].[AI_ICON] ([id], [name], [description]) VALUES (6, N'Humanoid', N' The AI appears as a humanoid
shape, but not necessarily human. Thiswould
include aliens, manlike monsters and other
humanoids. ')
SET IDENTITY_INSERT [dbo].[AI_ICON] OFF
GO
SET IDENTITY_INSERT [dbo].[AI_Personality] ON 

INSERT [dbo].[AI_Personality] ([id], [name], [description]) VALUES (1, N'Friendly, curious', N'The AI is motivated by an
interest in what happens around it. Like a
child, it is trusting and friendly. However, like
a child, it can lash out with incredible violence towards those who betray, threaten or
hurt it.')
INSERT [dbo].[AI_Personality] ([id], [name], [description]) VALUES (2, N'Hostile, paranoid', N'This AI is motivated by it''s
survival, and treats all incursions as a threat to
that goal. It will tend to attack when possible, withdraw and hole up when not. ')
INSERT [dbo].[AI_Personality] ([id], [name], [description]) VALUES (3, N'Stable, intelligent, businesslike', N'The AI sees
itself as an adult dealing with other adults. It
will not act out of fear, but out of rational self
interest. It will attack only if it sees it''s duty
compromised or safety threatened; it will
then tend to go for the least violent solution
to the threat. ')
INSERT [dbo].[AI_Personality] ([id], [name], [description]) VALUES (4, N'Intellectual, detached', N' The AI is a thinker. It
will watch and observe whenever possible,
compiling as much information as possible.
It is more likely to study the intruder from a
distance, eliminating it ruthlessly when the
intruder becomes a threat. ')
INSERT [dbo].[AI_Personality] ([id], [name], [description]) VALUES (5, N'Machinelikeand inhuman', N'TheAl has never
seen a reason to develop a human persona;
what human like qualities it possesses are
done only as a way of dealing with it''s
irrational masters. The AI will deal with threats
in an efficient, deadly manner. ')
INSERT [dbo].[AI_Personality] ([id], [name], [description]) VALUES (6, N'Remote and godlike', N'The AI is fully aware of
how limited humans are in relation to it''s
powerful mentality. It deals with people as
though they were small children who aren''t
too bright. Intruders are dealt with through
simple, direct, usually non-fatal methods.
Repeat offenders are considered to be too
stupid for their own good and are eliminated
the way a human crushes a bug. ')
SET IDENTITY_INSERT [dbo].[AI_Personality] OFF
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'101193123155468509694', N'Google', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'105187343631992512249', N'Google', N'47a5107a-e8aa-40bc-bc05-9a209cc6131c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'47a5107a-e8aa-40bc-bc05-9a209cc6131c', N'robert.myers39@gmail.com', N'ROBERT.MYERS39@GMAIL.COM', N'robert.myers39@gmail.com', N'ROBERT.MYERS39@GMAIL.COM', 0, NULL, N'ZEFARYAWLB6V7V4Q3VLHRKIU4IGZF5GJ', N'6234b36d-365b-4e9e-be77-69f4cd3bf8a8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'de277540-2189-43b0-977c-e42adee4a7a4', N'tuseroni', N'TUSERONI@GMAIL.COM', N'tuseroni@gmail.com', N'TUSERONI@GMAIL.COM', 1, NULL, N'UZR7GZUOKYSGCPHEIREZDT6B6HROJ2GL', N'6b5adc9d-af16-40be-9bfe-8f8a8f9719a0', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Computer] ON 

INSERT [dbo].[Computer] ([id], [name], [Memory], [Speed], [Int], [NumCPU], [IsPortable], [IsCyberAvailable], [BateryHours], [WallStrength], [PriceLow], [PriceHigh], [NumSlots], [Chipslots], [Description]) VALUES (1, N'Zetatech P5-4040 Portastation', 3, 6, 3, 1, 1, 1, 4, 1, 1000, 1300, 3, 10, N'Zetatech enters the mainframe age with their new portable CPU/workstation, the PS-4040. Using the Zetatech 90690 chip (a slight improvement on the 90689 processor; treat as INT 3) as the processing core of the unit, the computer packs a 30 MU storage bank, a 10-slot chipreader, cyberink and landline input ports, a letter-size printer, an optical scanner, keyboard, full stereo, a 1m by 1m video board, an external power plug, and a 4-hour internal power supply into a shock-and-bullet-proof briefrse (treat as 12 SP, 4 SDP), with the entire assemblage weighing in at 3 kilos! The Portastation has three expansion slots for add-ons, as well as an extra dedicated slot for a modem. Although the Portastation is a manual machine, it''s designed for cyber-control, and is easily upgraded (+300eb).
Netrunners take note: The PS 4040''s architecture is engineered to support cybermodem datafortressing (netrunning by linking a cybermodem through the computer) with all Zetatech cybermodems. (Chromebook 3)')
SET IDENTITY_INSERT [dbo].[Computer] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerImprovements] ON 

INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (1, N'Battery', N'BatteryHours', 1, 5, 5, 2, N'These are extra power sources to run computers. If mounted internally, each battery takes up 1/4 option slot A single battery runs a mini-computer for 1 hour, or a lap-top for 30 minutes, or a PC for 15 minutes.', 0.25)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (2, N'Chipreader', N'Chipslots', 10, 150, 150, 2, N'ach chipreader enables the computer to store 10 chips for reading (or encoding). A computer can only access 1 chip per point of INT, just like a human...Each chipreader takes up 1 option slot', 1)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (3, N'Databases', NULL, 0, 500, 500, 2, N'A database takes up 1/2 option slot They serve as pure informational databases on specific subjects, providing complete information on the subject, as long as the user knows where to look for the information. Each database is bought as applying to a specific area of knowledge (i.e., an Expert skill), at a level from +1 to +4. In order to use the database successfully, the user must make a skill roll on the specific skill or Library Use (the GM defines the difficulty of the roll based on the obscurity of the fact the player-character is trying to find). When successful, the desired fact is revealed to the player (for purposes of skill use, this boosts the PCUs skill by the database level).', 0.5)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (4, N'Dataports', N'NumSlots', 1, 100, 100, 2, N'A dataport add-on adds another port for datalines, external memory, and other peripherals. Each dataport takes up 1/2 option slot', 0.5)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (5, N'Datatel Modem Units', NULL, 0, 200, 1200, 2, N'For the ultimate in universal access, Datatel''s modems are what you need! By adding on a cable jack or cellular transmitter, your computer can connect with the Net and access databases, bulletin boards, the DataTerm network, Infocomp services, and an almost infinite selection of electronic media. Pay-per-view videos, electronic publishing, games, on-line rocker jams, and across-the-world shareware are all yours for the taking with this aftermarket add-on. Note: even if your computer is chipped for interface, you still cannot perform netrunning with this unit Buy a cybermodem already! A modem takes up one option slot Cellular links also include normal landline capability as a matter of course. (Chromebook 2)', 1)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (6, N'External Memory Modules', N'Memory', 1, 750, 750, 2, N'Memory mods are about the size of a pack of cigarettes, and add 10 MU to the computer''s memory when connected through a data/peripheral port.', 1)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (7, N'Holovid Driver', NULL, 0, 500, 500, 2, N'The ultimate in graphics packages, this enables a computer to program images for and drive holographic imaging systems, such as holoscreens and holotanks (page 29). Takes up 1/2 option slot', 0.5)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (8, N'Memory Upgrades', N'Memory', 1, 1000, 1000, 2, N'Adding extra memory is one of the first things done to most personal computers. Each Memory board added takes up 1 option slot and adds 10 MU to the computer''s memory.', 1)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (9, N'PC Backup Drives', NULL, 0, 100, 100, 2, N'PC backup drives are basically dedicated External Memory Modules (see page 9). They are designated as backup drive when purchased, and act in the same fashion as the Microtech backup drives (page 95).', 1)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (10, N'Processor Upgrades', N'Speed', 1, 200, 200, 2, N'No, you can''t pack any more core processing power into a workstation or portable; computer INT comes in 3-point chunks. But you sure can pump the processing speed of your machine! Each upgrade takes up 1/4 option slot and improves processing speed by +1, fora maximum of +4. This is rarely important while doing routine processing; if using the unit as a netrunning datafortress, this speed adds to the netrunner''s Deck Speed, and is usually used to offset speed penalties for running through the mainframe''s Multiprocessing program (page 19). (Chromebook 3)', 0.25)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (11, N'Powerstrip 2020', NULL, 0, 50, 50, 2, N'This book-sized item is a power monitor and circuit breaker. If an overdose of electricity comes through the computer''s power supply or inputs, the power strip breaks the circuit (90% of the time), shutting off the computer/cybermodem. Power overdoses are caused by unreliable power supplies and the effects of Stun, Hellbolt, Sword, and Firestarter programs. This will protect the Netrunner, but automatically drops him out of the Net If the computer/cybermodem has a battery power supply, that keeps the computer/cybermodem from shutting down when the powerstrip cuts in (thereby keeping the machine from going down while in the middle of computations, etc.), but the Net connection is still broken. (Chromebook 3)', 0)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (12, N'Smartstrip', NULL, 0, 250, 250, 2, N'his is a power monitor/transformer/battery arrangement, about the size of a 1 gallon/4 liter can. It monitors power inputs and compensates for over and under-loads - too much power is transferred to the battery, and too little power is supplemented by the battery. It automatically negates the effects of unreliable power supplies and the programs listed under Powerstrip 2020 above, while maintaining Net connections! That''s right, it doesn''t drop the machine out of the Net while negating nasty programs, but the ''runner does suffer a -3 to all Netrunning rolls during rounds when the Smartstrip is working, due to the microsecond ''hiccup'' as the power flow is adjusted. Smartstrip''s battery contains enough power to run a cybermodem for four hours (laptops 2 hours, personal computers 1 hour). (Chromebook 3)', 0)
INSERT [dbo].[ComputerImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [UnitTypeID], [Description], [Slots]) VALUES (13, N'Tritech Datashlelding', NULL, 0, 20, 20, 5, N'Tritech now offers datashielding as an aftermarket option for your computer system. By replacing the housing of your unit with a lead and hybrid alloy frame, and hardening sensitive electronics, your computer can be made immune to the effects of EMP, Microwaves, and Tempest equipment This service can be performed at your local Parts ''n Programs (or in 1D6+2 hours on an electronics roll of 25). (Chromebook 2)', 0)
SET IDENTITY_INSERT [dbo].[ComputerImprovements] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerPeripherals] ON 

INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (3, N'Direct Dataware EXPERT Series Computer Skill Programs Accounting (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (4, N'Direct Dataware EXPERT Series Computer Skill Programs Anthropology (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (5, N'Direct Dataware EXPERT Series Computer Skill Programs Botany (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (6, N'Direct Dataware EXPERT Series Computer Skill Programs Chemistry (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (7, N'Direct Dataware EXPERT Series Computer Skill Programs Corporate Policy (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (8, N'Direct Dataware EXPERT Series Computer Skill Programs Diagnose Illness (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (9, N'Direct Dataware EXPERT Series Computer Skill Programs Expert (subjects vary) (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (10, N'Direct Dataware EXPERT Series Computer Skill Programs Geology (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (11, N'Direct Dataware EXPERT Series Computer Skill Programs History (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (12, N'Direct Dataware EXPERT Series Computer Skill Programs Language (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (13, N'Direct Dataware EXPERT Series Computer Skill Programs Library Search (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (14, N'Direct Dataware EXPERT Series Computer Skill Programs Mathematics (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (15, N'Direct Dataware EXPERT Series Computer Skill Programs Physics (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (16, N'Direct Dataware EXPERT Series Computer Skill Programs System Knowledge (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (17, N'Direct Dataware EXPERT Series Computer Skill Programs Zoology (Base)', 200, 200, 2, 1, 4, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (18, N'Direct Dataware EXPERT Series Computer Skill Programs Accounting (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (19, N'Direct Dataware EXPERT Series Computer Skill Programs Anthropology (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (20, N'Direct Dataware EXPERT Series Computer Skill Programs Botany (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (21, N'Direct Dataware EXPERT Series Computer Skill Programs Chemistry (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (22, N'Direct Dataware EXPERT Series Computer Skill Programs Corporate Policy (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (23, N'Direct Dataware EXPERT Series Computer Skill Programs Diagnose Illness (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (24, N'Direct Dataware EXPERT Series Computer Skill Programs Expert (subjects vary) (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (25, N'Direct Dataware EXPERT Series Computer Skill Programs Geology (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (26, N'Direct Dataware EXPERT Series Computer Skill Programs History (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (27, N'Direct Dataware EXPERT Series Computer Skill Programs Language (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (28, N'Direct Dataware EXPERT Series Computer Skill Programs Library Search (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (29, N'Direct Dataware EXPERT Series Computer Skill Programs Mathematics (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (30, N'Direct Dataware EXPERT Series Computer Skill Programs Physics (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (31, N'Direct Dataware EXPERT Series Computer Skill Programs System Knowledge (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (32, N'Direct Dataware EXPERT Series Computer Skill Programs Zoology (Additional)', 200, 200, 2, 1, 1, N'These programs come prepackaged in small plastic boxes, complete with an instruction booklet and software stored on standard datachips (1MU per chip, each skill level uses one MU). Because of their MU size, the programs must be stored on a computer''s memory unit to be usable. These skill programs will add to the user''s INT skills, but they take time to run (one second per level of skill), unlike MRAM skillchips. Skill programs available include Accounting, Anthropology, Botany, Chemistry, Corporate Policy, Diagnose Illness, Expert (subjects vary), Geology, History, Language, Library Search, Mathematics, Physics, System Knowledge, and Zoology. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (33, N'Datatel RotoWrighter', 20, 20, 2, 0, NULL, N'These tiny, disposable printers are plugged into a computer (compatible with most E-books and personal computers; see Chromebook 2 pages 14-15) for small printing jobs. Each plastic pack holds a small reel of paper (20 pages) and a 3-color inkjet Once it''s empty, just throw it away. Size is 8cm x 4cm x 2.5cm. (Chromebook 3')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (34, N'Gloves and Goggles Interface', 100, 100, 2, 0, 0, N'The staple of Netrunners before the age of the neural interface and cybermodem link, the "G & G" system (often nicknamed GloGo Rigs) has long since been rendered obsolete by conventional neural interfacing technology. Made up of two parts: a set of oversized glasses which includes a wrap-around screen and position-sensitive sensors, and a sensory "glove", also with position sensors. While but suffers a -3 to the Interface skill. If used with a mainframe, a character can reduce the Expert (Complex Computer Language) skill penalty by two (i.e., from a -3 to a -1). See "Netrunning with Mainframes" (page 19).
NOTE: Mentioned in the description of Explorer One retro-cyberdeck (page 14). Good for those meat-deckers in the group. (Chromebook 4)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (35, N'"Hot Key" keypad', 100, 100, 2, 0, 0, N'Those who use mainframes for Netrunning have always been the snails of the Net The problem''s is the thought-action of Interfaces are just simply superior than eye-hand coordination, even with "GloGo" rigs and complex graphical interfaces. The "Hot Key'' pad can be programmed to reduce key-punching to a bare minimum. Each button can be programmed to activate a macro (pre-programmed series of commands), or other function. A program can be launched, a file can be downloaded with but a touch of a button. Reduces the Expert (Complex Computer Language) skill penalty by one (-3 to -2, for example). Note: cannot be used with the "G & G" interface, as it is already incorporated in a different form there. (See "Netrunning with Mainframes", pg. 19). (Chrom')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (36, N'Optics Heads-Up Display', 150, 200, 3, 0, 0, N'Kiroshi''s Heads-Up Displays can be connected to any computer system for totally accessible visual readouts. Both the headset and monocle models display a color image in the user''s  full access to computing power without requiring the user to look away from what he is doing. Endorsed by Trauma Team medics (who connect heads-up monocles to their medscanner units) as ma life save Also useful for technicians, surgeons, assembly line workers, and many others who need to have access to visual information while keeping track of their task. The display reduces Awareness skill checks by -3. A special version of the Heads-Up Display is available for corporate security operatives (and on the black market) for 300eb: a heads-up display which looks exactly like a pair of mirrorshades. Connected to a pocket computer by a tiny wire from the earpiece, these will pass casual inspection (Awareness vs. 20 to spot wire). (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (37, N'Language Processors', 40, 40, 5, 0, 0, N'Microtech is now offering aftermarket retrofits for any and all computers, allowing them full voice recognition and language comprehension ability (multiple language comprehension, if you add the proper expert database). Take your unit to your nearest Parts N'' Programs, and for 40% of your computer''s original cost, you can do away with keyboards and protocols entirely!
NOTE: Microtech markets its own versions of the PCX and E-Book with these processors already included (cost is only 20% more than normal). The processors can also be bought separately and installed in 1D6/2+2 hours on an electronics roll of 25. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (38, N'Line Tap Detector', 60, 60, 2, 0, 0, N'Tritech''s inexpensive line tap detector measures changes in line impedance to inform you when anyone is listening in on your conversations. Green, yellow, and red lights tell you when the line is clear, monitored from an extension, or tapped. This device will not detect surveillance of cellular phones or fiber-optic networks. (Chromebook 1)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (39, N'Linozap TM', 350, 350, 2, 0, 0, N'Simply press the button on the unit and 50 Kv of electricity will fuse the circuits of any listening devices attached to the line. An isolated transformer protects your own phone from damage. Be totally sure your line is secure.
Warning: Willful destruction of private property is a crime, and interfering with a legal tap is a felony. The manufacturer does not condone any illegal activity or illegal usage of this device. Manufacturer assumes no liability for damage to phone lines from use of this product. (Chromebook 1)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (40, N'Microtech Virtual Reality BBS', 10000, 10000, 2, 0, 0, N'Tired of tying up the memory in your own deck for a virtual reality? Now you have an alternative. Microtech''s VR-BBS is a cybermodem specifically designed for use as a Virtual Reality generator. This cyberdeck has a specialized Creator program that makes it easier to generate a virtual reality. When using the specialized programs treat the realism multipliers as being 1 level less. Weight 8kg.
GAME NOTES: MU40, Speed +1, Data Walls +3, only 10MU can be used for active running, the rest is VR storage. (Chromebook 2)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (41, N'Miniature Copier', 230, 230, 2, 0, 0, N'This is a portable, rechargeable, color, hand-copy machine. It has a wide copier head, a 1MU memory for storing images, and it holds eight feet of paper. It can be linked with most computers, so its stored memory can be transferred into the computer. It has an AC adapter and a 1 hour rechargeable battery. Weight 0.5kg. (Chromebook 3)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (42, N'Office Communications Suite', 1000, 2100, 2, 0, 0, N'Worldsat s integrated Cellular Phone/Fax/Message Machine system allows the enterprising executive to handle and manage his communications easily and efficiently. The answering machine keeps you from missing those important calls with a beeperless remote, and has a remote fax alarm as well. A built-in switching device selects between fax and voice transmissions automatically, preventing the annoyance of hearing the fax tone when you pick up the phone. The cellular capability can be carried on a standard cellular account, providing access anywhere service is available. And the printed transmission report logs all fax calls with error checking, all voice calls including number called and connection time, and all incoming calls, whether fax or voice. The system can also include a video intercom for a low extra cost. Office vid system 1100eb extra. (Chromebook 1)')
INSERT [dbo].[ComputerPeripherals] ([id], [name], [CostPerUnitLow], [CostPerUnitHigh], [UnitTypeID], [MU], [Bonus], [Description]) VALUES (43, N'WoridSat Communications FlopscreenTM', 400, 400, 1, 0, 0, N'WoridSat takes advantage of recent advantage in memory
plastics and fiber-optics to bring you the Flopscreen. The Flopscreen operates exactly like a videoboard when unfolded, but it can be rolled up and stowed in a pocket, or what have you. It has small adhesive surfaces on the back which allow it to be stuck onto a wall or floor (or ceiling) for display when connected to a computer. The Flopscreen can even be used while hanging on a rack or piled in a heap, although image distortion will occur. (Chromebook 2)')
SET IDENTITY_INSERT [dbo].[ComputerPeripherals] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerPeripheralSkillModifiers] ON 

INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (1, N'Direct Dataware EXPERT Series Computer Skill Programs Accounting (Base)', 39, 4, 3)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (2, N'Direct Dataware EXPERT Series Computer Skill Programs Anthropology (Base)', 40, 4, 4)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (3, N'Direct Dataware EXPERT Series Computer Skill Programs Botany (Base)', 42, 4, 5)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (4, N'Direct Dataware EXPERT Series Computer Skill Programs Chemistry (Base)', 44, 4, 6)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (5, N'Direct Dataware EXPERT Series Computer Skill Programs Corporate Policy (Base)', 105, 4, 7)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (6, N'Direct Dataware EXPERT Series Computer Skill Programs Diagnose Illness (Base)', 46, 4, 8)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (7, N'Direct Dataware EXPERT Series Computer Skill Programs Expert (subjects vary) (Base)', 48, 4, 9)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (8, N'Direct Dataware EXPERT Series Computer Skill Programs Geology (Base)', 50, 4, 10)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (9, N'Direct Dataware EXPERT Series Computer Skill Programs History (Base)', 52, 4, 11)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (10, N'Direct Dataware EXPERT Series Computer Skill Programs Language (Base)', 53, 4, 12)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (11, N'Direct Dataware EXPERT Series Computer Skill Programs Library Search (Base)', 54, 4, 13)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (12, N'Direct Dataware EXPERT Series Computer Skill Programs Mathematics (Base)', 55, 4, 14)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (13, N'Direct Dataware EXPERT Series Computer Skill Programs Physics (Base)', 56, 4, 15)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (14, N'Direct Dataware EXPERT Series Computer Skill Programs System Knowledge (Base)', 60, 4, 16)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (15, N'Direct Dataware EXPERT Series Computer Skill Programs Zoology (Base)', 63, 4, 17)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (16, N'Direct Dataware EXPERT Series Computer Skill Programs Accounting (Additional)', 39, 1, 18)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (17, N'Direct Dataware EXPERT Series Computer Skill Programs Anthropology (Additional)', 40, 1, 19)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (18, N'Direct Dataware EXPERT Series Computer Skill Programs Botany (Additional)', 42, 1, 20)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (19, N'Direct Dataware EXPERT Series Computer Skill Programs Chemistry (Additional)', 44, 1, 21)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (20, N'Direct Dataware EXPERT Series Computer Skill Programs Corporate Policy (Additional)', 105, 1, 22)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (21, N'Direct Dataware EXPERT Series Computer Skill Programs Diagnose Illness (Additional)', 46, 1, 23)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (22, N'Direct Dataware EXPERT Series Computer Skill Programs Expert (subjects vary) (Additional)', 48, 1, 24)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (23, N'Direct Dataware EXPERT Series Computer Skill Programs Geology (Additional)', 50, 1, 25)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (24, N'Direct Dataware EXPERT Series Computer Skill Programs History (Additional)', 52, 1, 26)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (25, N'Direct Dataware EXPERT Series Computer Skill Programs Language (Additional)', 53, 1, 27)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (26, N'Direct Dataware EXPERT Series Computer Skill Programs Library Search (Additional)', 54, 1, 28)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (27, N'Direct Dataware EXPERT Series Computer Skill Programs Mathematics (Additional)', 55, 1, 29)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (28, N'Direct Dataware EXPERT Series Computer Skill Programs Physics (Additional)', 56, 1, 30)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (29, N'Direct Dataware EXPERT Series Computer Skill Programs System Knowledge (Additional)', 60, 1, 31)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (30, N'Direct Dataware EXPERT Series Computer Skill Programs Zoology (Additional)', 63, 1, 32)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (31, N'Gloves and Goggles Interface', 17, -3, 34)
INSERT [dbo].[ComputerPeripheralSkillModifiers] ([id], [name], [SkillID], [Modifier], [ComputerPeripheralID]) VALUES (32, N'Optics Heads-Up Display', 41, -3, 36)
SET IDENTITY_INSERT [dbo].[ComputerPeripheralSkillModifiers] OFF
GO
SET IDENTITY_INSERT [dbo].[Cyberdeck] ON 

INSERT [dbo].[Cyberdeck] ([id], [name], [Memory], [Speed], [WallStrength], [PriceLow], [PriceHigh], [Description]) VALUES (1, N'Standard', 1, 0, 2, 500, 1000, N'Standard Cyberdeck')
INSERT [dbo].[Cyberdeck] ([id], [name], [Memory], [Speed], [WallStrength], [PriceLow], [PriceHigh], [Description]) VALUES (2, N'Portable', 1, 0, 2, 2000, 2000, N'These decks have internal, rechargeable power packs good for up
to 4 hours (recharge is 1 hour for every
hour of battery power). All combat, cyberlimb and cellular decks are of this type. A
portable deck costs 2000,0°')
INSERT [dbo].[Cyberdeck] ([id], [name], [Memory], [Speed], [WallStrength], [PriceLow], [PriceHigh], [Description]) VALUES (3, N'Cyberlimb', 1, 0, 2, 1000, 1000, N'Theseare portable decks
about the size of a pack of cigarettes. They
can be installed into a cyberlimb (phone
connection cables are jacked between the
limb and the phone lines). The deck itself is
hardwired right into the body along with
the controlling links for the cyberlimb. See
Putting the Cyber into the Punk, pg. 90-91,
for prices. ')
INSERT [dbo].[Cyberdeck] ([id], [name], [Memory], [Speed], [WallStrength], [PriceLow], [PriceHigh], [Description]) VALUES (4, N'Combat Assault', 1, 0, 2, 3000, 3000, N'These decks are
constructed of rugged ceramics and steel,
capable of taking bullet hits and crash
impacts (SP20). Most combat decks are
designed to be portable, and have adapter
cables which allow them to be plugged
into anytype of phone line. Around 30OOo0
when available (a DIFFICULT Task). ')
INSERT [dbo].[Cyberdeck] ([id], [name], [Memory], [Speed], [WallStrength], [PriceLow], [PriceHigh], [Description]) VALUES (5, N'Cellular', 1, 0, 2, 4000, 4000, N'These are portable decks
designed to link up with a cellular phone
net. They arevery effective anywhere within
a city, but are useless in rural areas (most
have jacks for manual phone patches). A
cellular deck has a 25% chance of losing
cellular connection when used in a moving
vehicle; a failed roll will automatically drop
the Netrunner out of the Net. But it''s a
small price to pay for the high level of
mobility offered by a cellular deck. A cellular deck costs 4000.00 ')
INSERT [dbo].[Cyberdeck] ([id], [name], [Memory], [Speed], [WallStrength], [PriceLow], [PriceHigh], [Description]) VALUES (6, N'Sealed Combat Assault', 1, 0, 2, 6000, 6000, N'Cellular combat assault, waterproof, has flipswitch standard')
SET IDENTITY_INSERT [dbo].[Cyberdeck] OFF
GO
SET IDENTITY_INSERT [dbo].[CyberdeckImprovements] ON 

INSERT [dbo].[CyberdeckImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [Description]) VALUES (1, N'Memory', N'Memory', 1, 500, 5000, N'For an additional 5,00Oeb, you
can purchase an additional memory for
your deck. This improves your program
power to 20 MU, double its stock size.')
INSERT [dbo].[CyberdeckImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [Description]) VALUES (2, N'Speed', N'Speed', 1, 200, 2000, N'For an additional 2,00Oeb, you
can increase your deck''s speed by one
level, up to a ceiling of 5. This can be a
lifesaver, as deck speed determines who
moves first in a Netrunner combat. And in
this game, last is dead. ')
INSERT [dbo].[CyberdeckImprovements] ([id], [name], [ImprovementFor], [ImprovementAmount], [CostLow], [CostHigh], [Description]) VALUES (3, N'Data Walls', N'WallStrength', 1, 100, 1000, N' For an additional 1,00Oeb,
you can increase your deck''s data wall
protection by one level, up to a ceiling of
10. Data walls are important; they are the
"armor" of the deck, resisting attacks from
anti-system programs. ')
SET IDENTITY_INSERT [dbo].[CyberdeckImprovements] OFF
GO
SET IDENTITY_INSERT [dbo].[CyberdeckOptions] ON 

INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (1, N'''Trode set', 10, 10, 2, N'e self-sticking electrodes that
allow you to run the Net without plugs.
''Trodes are slower than plugs (-2 to REF
when in the Net), but have no humanity
loss. They are commonly used by novice
runners and by "tourists" visiting the Net
on a lark')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (2, N'Keyboard', 100, 100, 2, N'an option which allow a
Netrunner to control a deck indirectly.
They are abysmally slow (-4 to REF), but are
immune to all anti-personnel attacks except Firestarter. ')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (3, N'Videoboard', 100, 100, 1, N'flat screen, high definition TV monitors which can be used to
show a Net''s-eye view to outsiders')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (4, N'Printer', 300, 300, 2, N'allow you to make hardcopy images and records from your deck. Most are
small laser-printers about the size of a large
book, using plain paper')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (5, N'Chipreader', 100, 100, 2, N'use standard data
chips (1 Oeb each) to store programs, images and other useful things from your
deck. They are about the size of a pack of
cigarettes.')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (6, N'VoxBoxes', 300, 300, 2, N'small speaker units that can
synthesize sound from a deck. They can
also be used by the Netrunner to talk to
outsiders while he''s in the Net. About the
size of a pack of smokes. ')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (7, N'Scanner', 100, 300, 2, N'flat plastic plates with optical
character reading and image recording
capacity. They range from the size of a
sheet of paper, all the way up to a meter on
a side. ')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (8, N'Interface Cables', 20, 30, 2, N' typical plug-ended splicing cables going from a cyber-operated machine to a person''s interface sockets. Necessary for ''running.')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (9, N'Low Impedance Cables', 60, 60, 2, N'special low-resistance/inter-ference cables for improved data transfer; they confer a +1 bonus on any interfacing tasks, such as controlling cyberve-hicles or Netrunning.')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (10, N'Auto Punchout', 330, 330, 2, N'Analysis plugs that instantly disconnect you when it detects any current stronger than a data signal. If attacked by any program that does physical damage to system components or ''runners, the Auto Punchout jacks you out before you or your hardware sustain damage. Bad news for Netrunners, though—the extra circuitry that signals must pass through slows the user''s Netrunning Initiative Roll by -5. (Chromebook 1)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (11, N'Batteries', 5, 5, 3, N'Spare high-capacitance liquid metal suspension power cells to run your portable cybermodem.
(Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (12, N'Code Gates', 1500, 1500, 2, N'Code Gates for cybermodems cost 1500eb per level; up to a max of +10. (Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (13, N'Cybermodem Interface', 500, 500, 2, N'Turns any plain cyberdeck into a cellular model. Never again will your Netrunner need to buy an overpriced cellular job, when for hundreds less, he/she can buy a phone with Zetatech''s new Cyberbaud 7 cellular deck upgrade.
NOTE: Due to extra circuitry, a -1 penalty to the Netrunner''s Interface skill is applied. (Chromebook 2)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (14, N'Dead Man''s Handle', 1000, 1000, 2, N'This addition requires the ''runner to send a mental signal at all times in order to remain jacked in. Naturally, this means that you can jack out by ceasing to send this signal. Since most programs that hold you in the Net do so by preventing you from signaling your deck to jack out, this means that you will be able to get out anyway. Note: MinFac recommends that you practice running with the Handle installed before putting it to any serious use.
GAME NOTE: when you start running with the Handle installed, you have a -3 penalty to all actions. This penalty drops by one for every six hours spent in the Net with the Handle, as you get used to the signal. In addition to the advertised use, the Handle gives you a chance of dropping out of the Net before attacks can hit you (or your deck). If you can roll 2D10 lower than your REF, you can jack out between realizing that you''ve been successfully attacked, and actually suffering the effects of it.')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (15, N'DeckMate', 100, 100, 2, N'Almost all off-the-shelf cybermodems are dedicated computers which exclusively support the capability to perform Netrunning. The Zetatech DeckMate is a plug-inoption that gives your deck the processing power of a pocket computer, allowing your cybermodem to perform all the functions of a multi-purpose microcomputer. The DeckMate incorporates an INT 1 liquid-crystal processor core (capable of performing one task at a time), a small keypad and LCD screen (for use without interface plugs), and a datachip port which can run audio, video or information media. The DeckMate has no memory of its own, using the deck''s memory to perform all the functions of a Zetatech EBook, including the use of CompuMods or other computer options. (Chromebook 2)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (16, N'Deck Security System', 400, 1000, 2, N'This Cyberdeck Security System consists of a thumbprint scanner which is connected to the deck''s CPU. Unless a pre-programmed print is used, the deck will not operate. A secondary monitor checks blood flow, so that a dismembered thumb cannot be used. The more advanced version uses a retina scanner (if the subject has cyberoptics, it checks the serial number of the optic).
(Chromebook 1)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (17, N'EBM 99080 MUSE', 300, 300, 2, N'Protect your data with EBMUs Memory Unit Selector Expansion. Once installed, its microcircuit switchers can physically engage and disengage the internal linkage between a deck''s systems and a set number of its integral Memory Units. The number of MUs that can be disengaged is not changeable and must be defined at the time of installation. The disengaged MUs are totally isolated from the deck''s other systems and thus from the Net as well; these MU will be safe from the effects of all attacking programs (except Firestarter, of course). The MUs'' status can be switched at the ''runner''s mental command (taking one Net-action), and installation can be performed by a Techie in a few hours for 75eb (Difficult Electronics roll).
(Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (18, N'EBM XR-10 Chip-Rack', 5000, 5000, 2, N'Approximately the size of a scientific-function pocket calculator, this after-market deck upgrade plugs into any available Input/Output (option) port on most cyberdeck models, effectively providing an additional 10MU to maximum capacity. This option does not add normal memory, but adds discrete memory instead. In game terms, if a program is loaded into an XR-10 is activated, the host-deck ignores an equal amount of program space in its own memory and runs the selected program and then returns to normal operation (the ''runner decides the memory to be overridden). The unusual operation of this system has the benefit of isolating inactive programming from the host-deck,the deck may sustain. This includes the effects of interface killers such as Poison Flatline and Firestarter. Normal deck memory is not protected by this system. (Roche Bartmoss'' Guide to the Net)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (19, N'Fiber-Optic Cable', 1, 1, 4, N'The backbone of the information society. These are the cables that carry all Net signals, and all cable TV. Standard quality cable, such as is used for the Net in North America, is 0.1eb/meter, and there''s a lot of it out there. Higher quality cables can be obtained, allowing faster data transmission, and +1 to all netrunning tasks, as long as the entire cable route to the destination is made of such stuff. (Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (20, N'Hardened Circuitry', 20, 20, 5, N'Have you every wondered why a military cyberdeck is on every hacker''s wish list? It''s more than just the armored casing. By enclosing all vital hardware and wiring within a composite shell of ceramics and polymers, interwoven with special metallic alloy threads, a combat deck is rendered immune to the effects of EMP, microwaves, magnetic fields, electric shocks, and mild radiation exposure. Standard decks may be upgraded by a skilled Tech if they can get ahold of the required materials. (I''m sure you''ll think of something!) (Roche Bartmoss'' Guide to the Net)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (21, N'Junctions', 100, 100, 2, N'These devices merge the flow of data in two fiber optics, and direct data along the correct route. They also tell the IG algorithms the physical location of the systems connected to them. These can be bought legally, since the network in a large building would need several. However, altering them to give false location information to the algorithms is illegal, and very hard (Very Difficult Electronics roll). (Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (22, N'Mini-printer', 125, 125, 2, N'Equal in size to the pocket computers or portable cyberdecks it''s linked to. Uses 500'' register paper (1eb per roll) and a tiny laser printer head. (Chromebook 1)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (23, N'Netrunner Flip Switch', 135, 135, 2, N'his system allows the Netrunner to "flip" from his perceived position in the Net to reality and back at a thought. A good way to check up on things when you''re ''running during a crisis situation. When "flipped" into reality, the Netrunner''s signal remains where he was, and he is still vulnerable to attack by ICE within the Net. The reality view is projected onto a 2m x 2m "window" in the Net, giving the view the Netrunner would normally see out of his own eyes. (Chromebook 1')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (24, N'Neural Recognition Security', 2000, 2000, 2, N'This cyberdeck security system scans the brainwave pattern of anyone who studs into the secured interface and checks it against a re-recorded pattern (presumably, that of the rightful owner). If the patterns don''t match, the secured system will not operate. Also available for vehicular interface systems. (Rache Bartmoss'' Guide to the Net)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (25, N'Repeaters', 1000, 1000, 2, N'Even fibre-optics aren''t perfect, and these devices are installed every hundred kilometers, to boost the strength of the signal. Interfering with one of these is a very good way to screw up the Net. If a repeater starts garbling its messages, provided that the garbling is fairly subtle, the automatic re-routers won''t notice right away. The right glitch (INT + System Knowledge roll, Difficulty 30) will bring the portions of the Net crashing down for about two hours (Ref''s discretion). Repeaters cannot be bought legally—InterNet wants to hold onto its pseudo-monopoly—but can be obtained on the black market, if you have the right contacts. (Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (26, N'Tight-Beam Radio Relay', 1500, 1500, 2, N'With this option, if the deck is outside the cell network, the unit sets up a scrambled, tight-beam radio link with your home base instead, allowing you to jack in through that socket. Now you can run from the depths of the Nevada desert, or the Rocky Mountains.
GAME NOTES: This is two units: the relay in the deck, and the receiver, back at base. The receiver has a range of 100km, although higher ranges might be available if you had the right contacts, or could build them yourself. If the receiver is damaged while you''re ''running, you are dumped from the Net. It can also be set to try the cellNet first, and only go for the radio link if you''re out of range. There is a -2 to Initiative rolls, and automatic dropout if the beam is blocked or jammed. (Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (27, N'Transcriptor', 150, 150, 2, N'A transcriptor is a printer option that will print out all Netspace locations visited, programs and icons encountered, and files copied—a hardware version of the Instant Replay utility program. Provides a great record for your solo friends to find out what happened to you (and great record of your Net-crimes and transgressions, if you let it fall into the wrong hands). (Chromebook 4)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (28, N'Zetatech Diagnet', 5000, 5000, 2, N'The Zetatech DiagNet allows you to test your deck and programming in a safe environment. This dedicated computer produces a simulated Net and simulated opposition, but does not actually send any signals that could damage you or your deck. Further, it sits in your room, so there is no need to pay InterNet when you use it. Now you can be sure that your programs don''t have any bugs before you hit the real virtual world.
GAME NOTES: Testing your products in this Net gives you a +1 to appropriate design skills, as you can take more risks. Zetatech sells supplementary chips at 1000eb each, which extend the simulated Net, and other entrepreneurs have got in on the act. Beware—there are still a few sabotaged versions around, where the black ICE can really kill you! (Chromebook 3)')
INSERT [dbo].[CyberdeckOptions] ([id], [name], [CostPerUinitLow], [CostPerUinitHigh], [UnitTypeID], [Description]) VALUES (29, N'Terminal', 400, 400, 2, N'a computer workstation including keyboard, video board, and I/O connectors. A terminal can be used to Netrun (making the runner immune to all anti-personnel software except that which affects vision, such as Dazzle), but is very, very slow (-5 to Interface Skills). Terminal operators are commonly known as "Net tortoises')
SET IDENTITY_INSERT [dbo].[CyberdeckOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[CyberdeckOptionsSkillModifiers] ON 

INSERT [dbo].[CyberdeckOptionsSkillModifiers] ([id], [name], [SkillID], [Modifier], [CyberdeckOptionID]) VALUES (1, N'Terminal', 17, -5, 29)
INSERT [dbo].[CyberdeckOptionsSkillModifiers] ([id], [name], [SkillID], [Modifier], [CyberdeckOptionID]) VALUES (2, N'Cybermodem Interface', 17, -1, 13)
SET IDENTITY_INSERT [dbo].[CyberdeckOptionsSkillModifiers] OFF
GO
SET IDENTITY_INSERT [dbo].[CyberdeckOptionsStatModifiers] ON 

INSERT [dbo].[CyberdeckOptionsStatModifiers] ([id], [name], [StatID], [Modifier], [CyberdeckOptionID]) VALUES (1, N'Trode Set', 2, -2, 1)
INSERT [dbo].[CyberdeckOptionsStatModifiers] ([id], [name], [StatID], [Modifier], [CyberdeckOptionID]) VALUES (2, N'Keyboard', 2, -4, 2)
SET IDENTITY_INSERT [dbo].[CyberdeckOptionsStatModifiers] OFF
GO
SET IDENTITY_INSERT [dbo].[Fortress] ON 

INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (1, 1, 4, 3, N'Test Fort', NULL, NULL, 0)
INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (2, 2, 3, 6, N'Somewhere', NULL, NULL, 0)
INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (3, 3, 7, 12, N'new', NULL, NULL, 1)
INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (1003, 4, 10, 0, N'Testing Ground', NULL, NULL, 0)
INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (1004, 6, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (1005, 7, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Fortress] ([id], [subgridID], [WallStrength], [Int], [Name], [AI_Personality_ID], [AI_ICON_ID], [isAI]) VALUES (1006, 8, 10, 12, N'infoSys', 1, 3, 1)
SET IDENTITY_INSERT [dbo].[Fortress] OFF
GO
SET IDENTITY_INSERT [dbo].[FortressCodeGates] ON 

INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1, 5, 2, 3, 1, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (2, 7, 5, 3, 1, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (3, 5, 8, 3, 2, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (4, 6, 7, 3, 2, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (5, 3, 7, 3, 2, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (6, 5, 6, 7, 3, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (7, 10, 6, 7, 3, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (8, 10, 9, 7, 3, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (9, 9, 3, 7, 3, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (10, 9, 10, 7, 3, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (11, 7, 8, 7, 3, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1003, 6, 7, 10, 1006, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1004, 6, 12, 5, 1006, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1005, 6, 12, NULL, NULL, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1006, 10, 15, 5, 1006, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1007, 16, 1, NULL, 1003, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1008, 18, 0, NULL, 1003, 4)
INSERT [dbo].[FortressCodeGates] ([id], [xPos], [yPos], [WallStrength], [FortressID], [Type]) VALUES (1009, 10, 8, 5, 1006, 4)
SET IDENTITY_INSERT [dbo].[FortressCodeGates] OFF
GO
SET IDENTITY_INSERT [dbo].[FortressCPU] ON 

INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1, 4, 5, 1, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (4, 7, 4, 2, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (5, 4, 4, 2, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (6, 3, 2, 3, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (7, 6, 2, 3, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (8, 6, 4, 3, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (9, 3, 4, 3, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1002, 5, 3, 1006, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1003, 7, 3, 1006, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1004, 5, 5, 1006, 2)
INSERT [dbo].[FortressCPU] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1005, 7, 5, 1006, 2)
SET IDENTITY_INSERT [dbo].[FortressCPU] OFF
GO
SET IDENTITY_INSERT [dbo].[FortressMemory] ON 

INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1, 3, 5, 1, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (2, 5, 5, 1, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (3, 4, 4, 1, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (4, 5, 4, 1, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (13, 3, 4, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (14, 4, 3, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (15, 5, 3, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (16, 5, 4, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (17, 6, 4, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (18, 6, 3, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (19, 7, 3, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (20, 8, 4, 2, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (21, 3, 3, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (22, 2, 3, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (23, 2, 2, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (24, 3, 1, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (25, 4, 2, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (26, 5, 2, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (27, 6, 1, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (28, 7, 2, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (29, 6, 3, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (30, 7, 4, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (31, 6, 5, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (32, 5, 4, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (33, 4, 4, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (34, 3, 5, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (35, 2, 4, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (36, 5, 5, 3, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1005, 5, 4, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1006, 4, 4, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1007, 6, 4, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1008, 6, 5, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1009, 6, 3, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1010, 6, 2, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1011, 5, 2, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1012, 4, 2, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1013, 4, 3, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1014, 4, 5, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1015, 4, 6, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1016, 5, 6, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1017, 6, 6, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1018, 7, 4, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1019, 8, 4, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1020, 8, 3, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1021, 7, 2, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1022, 8, 5, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1023, 7, 6, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1024, 8, 6, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1025, 8, 2, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1026, 6, 1, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1027, 3, 4, 1006, 3)
INSERT [dbo].[FortressMemory] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1028, 9, 4, 1006, 3)
SET IDENTITY_INSERT [dbo].[FortressMemory] OFF
GO
SET IDENTITY_INSERT [dbo].[FortressPrograms] ON 

INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1, 143, 1, 0, 2, 2, 2, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (2, 191, 1, 0, 6, 6, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (3, 206, 1, 0, 6, 8, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (6, 132, 1, 0, 6, 5, 1, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (7, 143, 1, 0, 2, 4, 8, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (13, 143, 2, 0, 2, 5, 7, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (14, 143, 2, 0, 3, 2, 11, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (15, 132, 2, 0, 6, 3, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (16, 157, 2, 0, 2, 5, 3, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (17, 191, 2, 0, 6, 4, 7, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (18, 143, 3, 0, 2, 9, 9, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (19, 143, 3, 0, 3, 2, 9, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (20, 143, 3, 0, 3, 2, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (21, 143, 3, 0, 3, 10, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (22, 143, 3, 0, 3, 8, 1, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (23, 206, 3, 0, 6, 8, 3, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (24, 206, 3, 0, 3, 1, 3, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (25, 206, 3, 0, 3, 5, 1, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1004, 157, 1006, 0, 2, 6, 4, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1005, 132, 1006, 0, 3, 4, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1006, 191, 1006, 0, 3, 8, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1007, 150, 1006, 0, 4, 8, 2, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1008, 143, 1006, 0, 2, 7, 6, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1009, 132, 1006, 0, 3, 5, 6, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1010, 134, 1006, 0, 4, 8, 8, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1011, 143, 1006, 0, 2, 4, 8, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1012, 206, 1006, 0, 6, 6, 6, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1013, 133, 1006, 0, 4, 8, 4, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1014, 133, 1003, 0, 4, 18, 1, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1015, 191, 1003, 0, 6, 8, 17, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1016, 190, 1003, 0, 2, 10, 17, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1017, 143, 1006, 0, 2, 16, 8, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1018, 195, 1006, 0, 5, 16, 5, 5)
INSERT [dbo].[FortressPrograms] ([id], [ProgramID], [FortressID], [Rezzed], [Strength], [xPos], [yPos], [Type]) VALUES (1019, 206, 1006, 0, 6, 11, 8, 5)
SET IDENTITY_INSERT [dbo].[FortressPrograms] OFF
GO
SET IDENTITY_INSERT [dbo].[FortressRemotes] ON 

INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1, 2, 3, 2, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (2, 3, 2, 2, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (24, 2, 7, 2, 7)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (25, 7, 7, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (26, 4, 10, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (27, 5, 10, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (28, 6, 10, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (29, 7, 10, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (30, 7, 11, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (31, 6, 11, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (32, 5, 11, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (33, 4, 11, 2, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (34, 8, 7, 2, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (35, 2, 10, 2, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (36, 9, 3, 2, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (37, 7, 2, 2, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (38, 8, 2, 2, 14)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (39, 8, 9, 2, 14)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (40, 9, 9, 2, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (41, 3, 9, 2, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (42, 9, 10, 2, 11)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (43, 9, 11, 2, 11)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (44, 7, 6, 2, 11)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (45, 8, 6, 2, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (46, 1, 1, 3, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (47, 8, 5, 3, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (48, 1, 5, 3, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (49, 5, 3, 3, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (50, 4, 5, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (51, 5, 8, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (52, 6, 8, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (53, 4, 8, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (54, 3, 8, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (55, 3, 9, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (56, 4, 9, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (57, 5, 9, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (58, 6, 9, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (59, 11, 3, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (60, 11, 2, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (61, 11, 4, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (62, 11, 5, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (63, 12, 2, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (64, 12, 3, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (65, 12, 4, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (66, 12, 5, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (67, 12, 1, 3, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (68, 1, 9, 3, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (69, 11, 1, 3, 11)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (70, 1, 8, 3, 11)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (71, 11, 9, 3, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (72, 11, 8, 3, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (73, 12, 9, 3, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (74, 12, 8, 3, 12)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1002, 6, 8, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1003, 5, 8, 1006, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1004, 7, 8, 1006, 12)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1005, 6, 11, 1006, 16)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1006, 6, 13, 1006, 16)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1007, 6, 17, 1006, 16)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1008, 6, 16, 1006, 17)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1009, 7, 13, 1006, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1010, 11, 13, 1006, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1011, 16, 13, 1006, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1012, 16, 17, 1006, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1013, 11, 17, 1006, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1014, 18, 2, 1003, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1015, 8, 0, 1003, 16)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1016, 9, 18, 1003, 16)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1017, 8, 16, 1003, 17)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1018, 18, 15, 1003, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1019, 18, 9, 1003, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1020, 1, 12, 1003, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1021, 1, 2, 1003, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1022, 16, 17, 1003, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1023, 8, 11, 1003, 17)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1024, 8, 6, 1003, 17)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1025, 19, 2, 1003, 12)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1026, 19, 1, 1003, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1027, 17, 2, 1003, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1028, 1, 1, 1003, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1029, 18, 4, 1003, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1030, 1, 17, 1003, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1031, 18, 17, 1003, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1032, 10, 1, 1003, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1033, 6, 1, 1003, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1034, 5, 7, 1003, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1035, 12, 7, 1003, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1036, 12, 17, 1003, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1037, 5, 17, 1003, 10)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1038, 1, 13, 1006, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1039, 9, 13, 1006, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1040, 1, 17, 1006, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1041, 9, 17, 1006, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1042, 6, 9, 1006, 19)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1043, 14, 7, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1044, 14, 6, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1045, 14, 5, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1046, 14, 4, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1047, 15, 4, 1006, 8)
GO
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1048, 15, 5, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1049, 15, 6, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1050, 15, 7, 1006, 8)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1051, 15, 3, 1006, 13)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1052, 14, 3, 1006, 12)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1053, 16, 2, 1006, 9)
INSERT [dbo].[FortressRemotes] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1054, 8, 1, 1003, 17)
SET IDENTITY_INSERT [dbo].[FortressRemotes] OFF
GO
SET IDENTITY_INSERT [dbo].[FortressWalls] ON 

INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1, 4, 2, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (2, 3, 3, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (3, 2, 4, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (4, 2, 5, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (5, 2, 6, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (6, 3, 7, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (7, 4, 7, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (8, 5, 7, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (9, 6, 6, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (10, 7, 6, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (11, 7, 4, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (12, 6, 3, 1, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (13, 1, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (14, 1, 2, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (15, 2, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (16, 1, 3, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (17, 3, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (21, 5, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (22, 10, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (23, 10, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (24, 1, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (25, 1, 11, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (26, 1, 10, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (27, 1, 9, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (28, 1, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (29, 1, 7, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (30, 1, 6, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (31, 1, 5, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (32, 1, 4, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (33, 2, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (34, 3, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (35, 4, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (36, 6, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (37, 7, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (38, 8, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (39, 9, 12, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (40, 10, 11, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (41, 10, 10, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (42, 10, 9, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (43, 10, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (44, 10, 7, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (45, 10, 6, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (46, 10, 5, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (47, 10, 4, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (48, 10, 3, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (49, 10, 2, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (50, 9, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (51, 8, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (52, 6, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (53, 7, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (54, 5, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (55, 4, 1, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (56, 6, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (57, 7, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (58, 8, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (59, 9, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (60, 4, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (61, 3, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (62, 2, 8, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (63, 3, 6, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (64, 2, 6, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (65, 6, 6, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (66, 6, 5, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (67, 7, 5, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (68, 8, 5, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (69, 9, 5, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (70, 9, 6, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (71, 9, 7, 2, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (72, 0, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (73, 0, 1, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (74, 0, 2, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (75, 0, 3, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (76, 0, 4, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (77, 0, 5, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (78, 1, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (79, 2, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (80, 3, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (81, 4, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (82, 5, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (83, 6, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (84, 7, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (85, 8, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (86, 9, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (87, 9, 2, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (88, 9, 1, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (89, 10, 8, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (90, 9, 4, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (91, 9, 5, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (92, 9, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (93, 8, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (94, 7, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (95, 6, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (96, 4, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (97, 3, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (98, 2, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (99, 1, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (100, 0, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (101, 10, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (102, 11, 0, 3, 1)
GO
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (103, 12, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (104, 13, 0, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (105, 13, 1, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (106, 13, 2, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (107, 13, 3, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (108, 13, 4, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (109, 13, 5, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (110, 13, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (111, 12, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (112, 11, 6, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (113, 0, 7, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (114, 0, 8, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (115, 0, 9, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (116, 0, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (117, 1, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (118, 2, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (119, 3, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (120, 4, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (121, 5, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (122, 6, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (123, 7, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (124, 7, 9, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (125, 14, 8, NULL, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (126, 7, 7, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (127, 13, 9, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (128, 13, 8, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (129, 13, 7, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (130, 13, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (131, 12, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (132, 11, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (133, 10, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (134, 11, 7, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (135, 12, 7, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (136, 8, 10, 3, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1013, 3, 6, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1014, 3, 5, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1015, 2, 5, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1016, 2, 4, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1017, 2, 3, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1018, 3, 3, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1019, 3, 2, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1020, 3, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1021, 4, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1022, 5, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1023, 6, 0, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1024, 5, 0, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1025, 7, 0, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1026, 7, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1027, 8, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1028, 9, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1029, 9, 2, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1030, 9, 3, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1031, 10, 3, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1032, 10, 4, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1033, 10, 5, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1034, 9, 5, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1035, 9, 6, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1036, 9, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1037, 8, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1038, 7, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1039, 5, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1040, 4, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1041, 3, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1042, 3, 8, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1043, 3, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1044, 4, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1045, 5, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1046, 7, 10, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1047, 7, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1048, 8, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1049, 9, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1050, 10, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1051, 5, 10, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1052, 5, 11, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1053, 5, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1054, 7, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1055, 7, 11, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1056, 11, 10, NULL, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1057, 4, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1058, 3, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1059, 2, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1060, 1, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1061, 0, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1062, 8, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1063, 9, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1064, 10, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1065, 10, 13, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1066, 10, 14, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1067, 12, 10, NULL, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1068, 10, 16, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1069, 10, 17, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1070, 10, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1071, 0, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1072, 0, 17, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1073, 0, 16, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1074, 0, 15, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1075, 0, 14, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1076, 0, 13, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1077, 1, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1078, 3, 18, 1006, 1)
GO
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1079, 2, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1080, 4, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1081, 11, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1082, 5, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1083, 7, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1084, 6, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1085, 8, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1086, 9, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1087, 11, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1088, 12, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1089, 13, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1090, 14, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1091, 15, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1092, 16, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1093, 17, 12, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1094, 17, 13, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1095, 17, 14, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1096, 17, 15, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1097, 17, 16, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1098, 17, 17, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1099, 17, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1100, 16, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1101, 15, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1102, 14, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1103, 13, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1104, 12, 18, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1105, 16, 2, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1106, 16, 3, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1107, 17, 3, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1108, 18, 3, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1109, 19, 3, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1110, 16, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1111, 17, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1112, 19, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1113, 5, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1114, 3, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1115, 4, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1116, 2, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1117, 1, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1118, 0, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1119, 7, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1120, 6, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1121, 0, 1, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1122, 0, 2, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1123, 0, 3, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1124, 0, 4, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1125, 0, 5, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1126, 0, 6, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1127, 0, 7, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1128, 0, 8, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1129, 0, 9, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1130, 0, 10, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1131, 0, 11, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1132, 0, 12, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1133, 0, 13, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1134, 0, 14, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1135, 0, 15, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1136, 0, 16, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1137, 0, 17, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1138, 0, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1139, 1, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1140, 2, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1141, 3, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1142, 4, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1143, 5, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1144, 6, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1145, 7, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1146, 8, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1147, 10, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1148, 11, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1149, 12, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1150, 13, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1151, 14, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1152, 15, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1153, 16, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1154, 17, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1155, 18, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1156, 19, 18, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1157, 19, 17, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1158, 19, 16, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1159, 19, 15, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1160, 19, 14, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1161, 19, 13, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1162, 19, 12, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1163, 19, 11, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1164, 19, 10, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1165, 19, 9, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1166, 19, 8, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1167, 19, 7, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1168, 19, 6, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1169, 19, 5, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1170, 19, 4, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1171, 15, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1172, 14, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1173, 13, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1174, 12, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1175, 11, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1176, 10, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1177, 9, 0, 1003, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1178, 10, 9, 1006, 1)
GO
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1179, 13, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1180, 13, 6, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1181, 13, 5, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1182, 13, 4, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1183, 13, 3, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1184, 13, 2, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1185, 13, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1186, 14, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1187, 15, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1188, 16, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1189, 17, 1, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1190, 17, 2, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1191, 17, 3, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1192, 17, 4, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1193, 17, 5, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1194, 17, 6, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1195, 17, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1196, 17, 8, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1197, 17, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1198, 14, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1199, 13, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1200, 12, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1201, 11, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1202, 10, 6, NULL, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1203, 15, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1204, 16, 9, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1205, 12, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1206, 11, 7, 1006, 1)
INSERT [dbo].[FortressWalls] ([id], [xPos], [yPos], [FortressID], [Type]) VALUES (1207, 10, 5, 1006, 1)
SET IDENTITY_INSERT [dbo].[FortressWalls] OFF
GO
SET IDENTITY_INSERT [dbo].[NetObjType] ON 

INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (1, N'Wall', N'Wall', N'<svg class="NetOBJ Wall"		data-netobjtypeid="1"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Wall				 </title><rect width="512" height="512" fill="black"></rect></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (2, N'CPU', N'CPU', N'<svg class="NetOBJ CPU"			data-netobjtypeid="2"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>CPU				 </title>	<circle cx="256" cy="256" r="180" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></circle><line x1="51" x2="455" y1="51" y2="455" stroke="black" stroke-width="40"></line><line x1="51" x2="455" y1="455" y2="51" stroke="black" stroke-width="40"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (3, N'Memory', N'Memory', N'<svg class="NetOBJ Memory"		data-netobjtypeid="3"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Memory				 </title>	<rect x="81" y="51" width="350" height="410" stroke="black" stroke-width="40" fill="white" fill-opacity="0"></rect></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (4, N'CodeGate', N'Code Gate', N'<svg class="NetOBJ CodeGate"	data-netobjtypeid="4"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Code Gate			 </title><rect x="51" y="51" fill="white" stroke="black" stroke-width="50" width="400" height="400" fill-opacity="0"></rect><line x1="31" x2="450" y1="140" y2="140" stroke="black" stroke-width="30"></line><line x1="31" x2="450" y1="360" y2="360" stroke="black" stroke-width="30"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (5, N'Program', N'Program', N'<svg class="NetOBJ Program"		data-netobjtypeid="5"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="15px" width="20px"><title>Program			 </title>	<path fill="black" d="M439.15 453.06L297.17 384l141.99-69.06c7.9-3.95 11.11-13.56 7.15-21.46L432 264.85c-3.95-7.9-13.56-11.11-21.47-7.16L224 348.41 37.47 257.69c-7.9-3.95-17.51-.75-21.47 7.16L1.69 293.48c-3.95 7.9-.75 17.51 7.15 21.46L150.83 384 8.85 453.06c-7.9 3.95-11.11 13.56-7.15 21.47l14.31 28.63c3.95 7.9 13.56 11.11 21.47 7.15L224 419.59l186.53 90.72c7.9 3.95 17.51.75 21.47-7.15l14.31-28.63c3.95-7.91.74-17.52-7.16-21.47zM150 237.28l-5.48 25.87c-2.67 12.62 5.42 24.85 16.45 24.85h126.08c11.03 0 19.12-12.23 16.45-24.85l-5.5-25.87c41.78-22.41 70-62.75 70-109.28C368 57.31 303.53 0 224 0S80 57.31 80 128c0 46.53 28.22 86.87 70 109.28zM280 112c17.65 0 32 14.35 32 32s-14.35 32-32 32-32-14.35-32-32 14.35-32 32-32zm-112 0c17.65 0 32 14.35 32 32s-14.35 32-32 32-32-14.35-32-32 14.35-32 32-32z"></path></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (6, N'Netrunner', N'Netrunner', N'<svg class="NetOBJ Program"		data-netobjtypeid="5"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Netrunner			 </title>	<path fill="black" d="M439.15 453.06L297.17 384l141.99-69.06c7.9-3.95 11.11-13.56 7.15-21.46L432 264.85c-3.95-7.9-13.56-11.11-21.47-7.16L224 348.41 37.47 257.69c-7.9-3.95-17.51-.75-21.47 7.16L1.69 293.48c-3.95 7.9-.75 17.51 7.15 21.46L150.83 384 8.85 453.06c-7.9 3.95-11.11 13.56-7.15 21.47l14.31 28.63c3.95 7.9 13.56 11.11 21.47 7.15L224 419.59l186.53 90.72c7.9 3.95 17.51.75 21.47-7.15l14.31-28.63c3.95-7.91.74-17.52-7.16-21.47zM150 237.28l-5.48 25.87c-2.67 12.62 5.42 24.85 16.45 24.85h126.08c11.03 0 19.12-12.23 16.45-24.85l-5.5-25.87c41.78-22.41 70-62.75 70-109.28C368 57.31 303.53 0 224 0S80 57.31 80 128c0 46.53 28.22 86.87 70 109.28zM280 112c17.65 0 32 14.35 32 32s-14.35 32-32 32-32-14.35-32-32 14.35-32 32-32zm-112 0c17.65 0 32 14.35 32 32s-14.35 32-32 32-32-14.35-32-32 14.35-32 32-32z"></path></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (7, N'LDL', N'LDL', N'<svg class="NetOBJ LDL"			data-netobjtypeid="7"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>LDL 				 </title><rect x="31" y="31" fill="white" stroke="black" stroke-width="50" width="450" height="450" fill-opacity="0"></rect><polygon points="51,390 256,145 450,390" fill="black" stroke="black" stroke-width="1"></polygon></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (8, N'Terminal', N'Terminal', N'<svg class="NetOBJ Terminal"	data-netobjtypeid="8"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Terminal			 </title><rect x="76" y="31" width="250" height="280" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></rect><rect x="31" y="375" width="350" height="105" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></rect><line x1="375" x2="475" y1="420" y2="420" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (9, N'Camera', N'Camera', N'<svg class="NetOBJ Camera"		data-netobjtypeid="9"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Camera				 </title>	<rect x="31" y="81" width="350" height="350" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></rect><rect x="381" y="186" width="100" height="150" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></rect></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (10, N'Microphone', N'Microphone', N'<svg class="NetOBJ Microphone"	data-netobjtypeid="10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Microphone			 </title>	<circle cx="181" cy="256" r="135" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></circle><line x1="321" x2="481" y1="256" y2="256" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (11, N'Videoscreen', N'Videoscreen', N'<svg class="NetOBJ Videoscreen" data-netobjtypeid="11" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Videoscreen		 </title>	<rect x="51" y="51" fill="white" stroke="black" stroke-width="50" width="400" height="400" fill-opacity="0"></rect><line x1="56" x2="456" y1="56" y2="456" stroke="black" stroke-width="50"></line><line x1="456" x2="56" y1="56" y2="456" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (12, N'Holodisplay', N'Holodisplay', N'<svg class="NetOBJ Holodisplay" data-netobjtypeid="12" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Holodisplay		 </title>	<polygon points="31,56 256,345 466,56" fill="black" stroke="black" stroke-width="1"></polygon></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (13, N'Printer', N'Printer', N'<svg class="NetOBJ Printer"		data-netobjtypeid="13" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Printer			 </title>	<polygon points="101,31 352,31 417,131 417,437 101,437" fill="white" stroke="black" stroke-width="50" fill-opacity="0"></polygon><line x1="322" x2="322" y1="56" y2="156" stroke="black" stroke-width="30"></line><line x1="307" x2="417" y1="156" y2="156" stroke="black" stroke-width="30"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (14, N'Alarm', N'Alarm', N'<svg class="NetOBJ Alarm"		data-netobjtypeid="14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Alarm				 </title><circle cx="256" cy="256" r="180" stroke="black" stroke-width="50" fill="white" fill-opacity="0"></circle><line x1="236" x2="481" y1="276" y2="31" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (15, N'Door', N'Door/Gate', N'<svg class="NetOBJ Door"		data-netobjtypeid="15" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Door/Gate			 </title><rect x="31" y="206" fill="white" stroke="black" stroke-width="50" width="200" height="250" fill-opacity="0"></rect><line x1="226" x2="486" y1="312" y2="181" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (16, N'Elevator', N'Elevator', N'<svg class="NetOBJ Elevator"	data-netobjtypeid="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Elevator			 </title><rect x="116" y="151" fill="white" stroke="black" stroke-width="50" width="280" height="280" fill-opacity="0"></rect><line x1="226" x2="226" y1="31" y2="151" stroke="black" stroke-width="50"></line><line x1="302" x2="302" y1="6" y2="151" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (17, N'Manipulator', N'Manipulator', N'<svg class="NetOBJ Manipulator" data-netobjtypeid="17" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Manipulator		 </title>	<line x1="26" x2="125" y1="46" y2="225" stroke="black" stroke-width="50"></line><line x1="110" x2="350" y1="220" y2="220" stroke="black" stroke-width="50"></line><line x1="350" x2="350" y1="46" y2="370" stroke="black" stroke-width="50"></line><line x1="350" x2="500" y1="71" y2="71" stroke="black" stroke-width="50"></line><line x1="350" x2="500" y1="345" y2="345" stroke="black" stroke-width="50"></line></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (18, N'Autofactory', N'Autofactory', N'<svg class="NetOBJ Autofactory" data-netobjtypeid="18" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Autofactory		 </title>	<rect x="31" y="171" width="450" height="150" stroke="black" stroke-width="50" fill="white"></rect><rect x="126" y="31" width="100" height="425" stroke="black" stroke-width="50" fill="white"></rect><rect x="326" y="56" width="75" height="350" stroke="black" stroke-width="50" fill="white"></rect></svg>')
INSERT [dbo].[NetObjType] ([id], [Name], [Title], [SVG]) VALUES (19, N'Vehicle', N'Remote Vehicle/Robot', N'<svg class="NetOBJ Vehicle"     data-netobjtypeid="19" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" height="20px" width="20px"><title>Remote Vehicle/Robot</title>	<rect x="31" y="106" fill="white" stroke="black" stroke-width="50" width="450" height="150" fill-opacity="0"></rect><circle cx="131" cy="256" r="50" stroke="black" stroke-width="50" fill="black"></circle><circle cx="381" cy="256" r="50" stroke="black" stroke-width="50" fill="black"></circle></svg>')
SET IDENTITY_INSERT [dbo].[NetObjType] OFF
GO
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([id], [Handle], [SIN], [IP], [REP], [Humanity], [Dammage], [RoleID], [aspUserID], [xPos], [yPos], [Type]) VALUES (3, N'DEADFEED', N'3735-94-4941', 17, 1, 79, 4, 3, N'de277540-2189-43b0-977c-e42adee4a7a4', 0, 0, 6)
INSERT [dbo].[Player] ([id], [Handle], [SIN], [IP], [REP], [Humanity], [Dammage], [RoleID], [aspUserID], [xPos], [yPos], [Type]) VALUES (6, N'Testicles', N'123-45-6789', 0, 0, 0, 0, 5, N'de277540-2189-43b0-977c-e42adee4a7a4', 0, 0, 6)
INSERT [dbo].[Player] ([id], [Handle], [SIN], [IP], [REP], [Humanity], [Dammage], [RoleID], [aspUserID], [xPos], [yPos], [Type]) VALUES (7, N'foobart', NULL, 0, 0, 0, 0, NULL, N'de277540-2189-43b0-977c-e42adee4a7a4', 0, 0, 6)
INSERT [dbo].[Player] ([id], [Handle], [SIN], [IP], [REP], [Humanity], [Dammage], [RoleID], [aspUserID], [xPos], [yPos], [Type]) VALUES (8, N'bartman', NULL, 0, 0, 0, 0, NULL, N'de277540-2189-43b0-977c-e42adee4a7a4', 0, 0, 6)
INSERT [dbo].[Player] ([id], [Handle], [SIN], [IP], [REP], [Humanity], [Dammage], [RoleID], [aspUserID], [xPos], [yPos], [Type]) VALUES (9, N'Grifter', NULL, 0, 0, 16, 0, NULL, N'de277540-2189-43b0-977c-e42adee4a7a4', 0, 0, 6)
SET IDENTITY_INSERT [dbo].[Player] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerComputer] ON 

INSERT [dbo].[PlayerComputer] ([id], [name], [ComputerID], [PlayerID], [description], [isCyberEnabled]) VALUES (2, N'Zetatech P5-4040 Portastation', 1, 3, N'Zetatech P5-4040 Portastation', 1)
SET IDENTITY_INSERT [dbo].[PlayerComputer] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerComputerImprovements] ON 

INSERT [dbo].[PlayerComputerImprovements] ([id], [PlayerComputerID], [ComputerImprovementsID], [Quantity]) VALUES (1, 2, 8, 1)
INSERT [dbo].[PlayerComputerImprovements] ([id], [PlayerComputerID], [ComputerImprovementsID], [Quantity]) VALUES (2, 2, 10, 2)
SET IDENTITY_INSERT [dbo].[PlayerComputerImprovements] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerComputerOptions] ON 

INSERT [dbo].[PlayerComputerOptions] ([id], [PlayerComputerID], [ComputerPeripheralsID]) VALUES (1, 2, 15)
INSERT [dbo].[PlayerComputerOptions] ([id], [PlayerComputerID], [ComputerPeripheralsID]) VALUES (2, 2, 13)
INSERT [dbo].[PlayerComputerOptions] ([id], [PlayerComputerID], [ComputerPeripheralsID]) VALUES (3, 2, 28)
INSERT [dbo].[PlayerComputerOptions] ([id], [PlayerComputerID], [ComputerPeripheralsID]) VALUES (4, 2, 14)
SET IDENTITY_INSERT [dbo].[PlayerComputerOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerComputerPrograms] ON 

INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (1, 251, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (2, 231, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (3, 244, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (4, 255, 2, 0, 5, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (5, 232, 2, 0, 3, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (6, 233, 2, 0, 5, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (7, 240, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (8, 242, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (9, 241, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (10, 147, NULL, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (11, 209, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (12, 205, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (13, 228, 2, 0, 3, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (14, 157, 2, 0, 2, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (15, 128, NULL, 0, -1, 0, 5)
INSERT [dbo].[PlayerComputerPrograms] ([id], [ProgramID], [PlayerComputerID], [Rezzed], [Strength], [Packed], [Type]) VALUES (16, 144, 2, 0, 3, 0, 5)
SET IDENTITY_INSERT [dbo].[PlayerComputerPrograms] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerCyberdeck] ON 

INSERT [dbo].[PlayerCyberdeck] ([id], [name], [CyberdeckID], [PlayerID], [description]) VALUES (2, N'DEADFEED Deck', 5, 3, N'DEADFEED''S Dedicated and Durable Deck')
SET IDENTITY_INSERT [dbo].[PlayerCyberdeck] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerCyberdeckImprovements] ON 

INSERT [dbo].[PlayerCyberdeckImprovements] ([id], [PlayerCyberdeckID], [CyberdeckImprovementsID], [Quantity]) VALUES (1, 2, 1, 2)
INSERT [dbo].[PlayerCyberdeckImprovements] ([id], [PlayerCyberdeckID], [CyberdeckImprovementsID], [Quantity]) VALUES (2, 2, 2, 5)
SET IDENTITY_INSERT [dbo].[PlayerCyberdeckImprovements] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerCyberdeckOptions] ON 

INSERT [dbo].[PlayerCyberdeckOptions] ([id], [PlayerCyberdeckID], [CyberdeckOptionsID]) VALUES (1, 2, 1)
INSERT [dbo].[PlayerCyberdeckOptions] ([id], [PlayerCyberdeckID], [CyberdeckOptionsID]) VALUES (2, 2, 9)
INSERT [dbo].[PlayerCyberdeckOptions] ([id], [PlayerCyberdeckID], [CyberdeckOptionsID]) VALUES (3, 2, 5)
INSERT [dbo].[PlayerCyberdeckOptions] ([id], [PlayerCyberdeckID], [CyberdeckOptionsID]) VALUES (4, 2, 23)
SET IDENTITY_INSERT [dbo].[PlayerCyberdeckOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerCyberdeckPrograms] ON 

INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (1, 4, 2, 0, 2, 1, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (2, 195, 2, 0, 5, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (3, 6, 2, 0, 1, 1, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (4, 178, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (6, 170, 2, 0, 3, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (7, 171, 2, 0, -1, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (8, 267, 2, 0, 6, 1, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (9, 130, 2, 0, -1, 1, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (10, 175, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (11, 254, 2, 0, 10, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (12, 246, 2, 0, 6, 1, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (13, 168, 2, 0, 5, 1, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (14, 169, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (15, 196, 2, 0, 4, 0, 5)
INSERT [dbo].[PlayerCyberdeckPrograms] ([id], [ProgramID], [PlayerCyberdeckID], [Rezzed], [Strength], [Packed], [Type]) VALUES (16, 261, 2, 0, 3, 0, 5)
SET IDENTITY_INSERT [dbo].[PlayerCyberdeckPrograms] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerPrograms] ON 

INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (12, 264, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (13, 265, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (14, 268, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (15, 268, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (16, 268, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (17, 268, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (18, 268, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (19, 128, 3, 0, 0)
INSERT [dbo].[PlayerPrograms] ([id], [ProgramID], [PlayerID], [Rezzed], [Strength]) VALUES (20, 147, 3, 0, 0)
SET IDENTITY_INSERT [dbo].[PlayerPrograms] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerRoles] ON 

INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (1, N'Solo')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (2, N'Rocker')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (3, N'Netrunner')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (4, N'Media')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (5, N'Nomad')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (6, N'Fixer')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (7, N'Cop')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (8, N'Corp')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (9, N'Techie')
INSERT [dbo].[PlayerRoles] ([id], [Name]) VALUES (10, N'Medtechie')
SET IDENTITY_INSERT [dbo].[PlayerRoles] OFF
GO
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 14)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 65)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 66)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 71)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 73)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 74)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 82)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 83)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 84)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (1, 104)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 13)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 23)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 31)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 35)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 37)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 38)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 45)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 66)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (2, 103)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 17)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 45)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 47)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 57)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 60)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 87)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 89)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 90)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (3, 93)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 15)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 31)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 32)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 33)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 36)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 37)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 45)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 47)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (4, 99)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 16)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 24)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 62)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 65)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 66)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 69)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 74)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 82)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (5, 87)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 21)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 28)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 37)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 66)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 71)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 74)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 96)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 101)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (6, 102)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 12)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 27)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 31)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 32)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 47)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 65)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 66)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 71)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (7, 74)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 20)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 22)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 23)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 32)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 36)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 37)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 47)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 54)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (8, 59)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 18)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 47)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 61)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 85)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 87)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 90)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 93)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 94)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 97)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (9, 104)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 19)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 32)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 41)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 46)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 47)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 54)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 63)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 87)
GO
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 88)
INSERT [dbo].[PlayerRoleSkills] ([PlayerRoleID], [SkillID]) VALUES (10, 100)
GO
SET IDENTITY_INSERT [dbo].[PlayerSkill] ON 

INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (188, 0, 0, 0, 3, 12, N'Authority (Cops)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (189, 0, 0, 0, 3, 13, N'Charismatic Leadership (Rockers)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (190, 0, 0, 0, 3, 14, N'Combat Sense (Solos)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (191, 0, 0, 0, 3, 15, N'Credibility (Medias)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (192, 0, 0, 0, 3, 16, N'Family (Nomad)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (193, 7, 0, 4, 3, 17, N'Interface (Netrunner)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (194, 0, 0, 0, 3, 18, N'Jury Rig (Techie)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (195, 0, 0, 0, 3, 19, N'Medical Tech (Medtech)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (196, 0, 0, 0, 3, 20, N'Resources (Corporate)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (197, 0, 0, 0, 3, 21, N'Streetdeal (Fixer)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (198, 0, 0, 0, 3, 22, N'Personal Grooming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (199, 0, 0, 0, 3, 23, N'Wardrobe & Style', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (200, 0, 0, 0, 3, 24, N'Endurance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (201, 0, 0, 0, 3, 25, N'Strength Feat', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (202, 0, 0, 0, 3, 26, N'Swimming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (203, 0, 0, 0, 3, 27, N'Interrogation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (204, 0, 0, 0, 3, 28, N'Intimidate', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (205, 0, 0, 0, 3, 29, N'Oratory', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (206, 0, 0, 0, 3, 30, N'ResistTorture/Drugs', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (207, 0, 0, 0, 3, 31, N'Streetwise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (208, 0, 0, 0, 3, 32, N'Human Perception', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (209, 0, 0, 0, 3, 33, N'Interview', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (210, 0, 0, 0, 3, 34, N'Leadership', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (211, 0, 0, 0, 3, 35, N'Seduction', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (212, 0, 0, 0, 3, 36, N'Social', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (213, 0, 0, 0, 3, 37, N'Persuasion & Fast Talk', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (214, 0, 0, 0, 3, 38, N'Perform', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (215, 0, 0, 0, 3, 39, N'Accounting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (216, 0, 0, 0, 3, 40, N'Anthropology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (217, 2, 0, 0, 3, 41, N'Awareness/Notice', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (218, 0, 0, 0, 3, 42, N'Biology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (219, 0, 0, 0, 3, 43, N'Botany', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (220, 0, 0, 0, 3, 44, N'Chemistry', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (221, 1, 0, 0, 3, 45, N'Composition', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (222, 0, 0, 0, 3, 46, N'Diagnose Illness', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (223, 4, 0, 0, 3, 47, N'Education 8 General Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (224, 0, 0, 0, 3, 48, N'Expert', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (225, 0, 0, 0, 3, 49, N'Gamb1e', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (226, 0, 0, 0, 3, 50, N'Geology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (227, 0, 0, 0, 3, 51, N'Hide/Evade', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (228, 0, 0, 0, 3, 52, N'History', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (229, 0, 0, 0, 3, 53, N'Know Language', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (230, 4, 0, 13, 3, 54, N'Library Search', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (231, 0, 0, 0, 3, 55, N'Mathematics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (232, 0, 0, 0, 3, 56, N'Physics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (233, 6, 0, 0, 3, 57, N'Programming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (234, 0, 0, 0, 3, 58, N'Shadow/Track', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (235, 0, 0, 0, 3, 59, N'Stock Market', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (236, 0, 0, 0, 3, 60, N'System Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (237, 0, 0, 0, 3, 61, N'Teaching', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (238, 0, 0, 0, 3, 62, N'Wilderness Survival', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (239, 0, 0, 0, 3, 63, N'Zoology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (240, 0, 0, 0, 3, 64, N'Archery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (241, 0, 0, 0, 3, 65, N'Athletics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (242, 0, 0, 0, 3, 66, N'Brawling', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (243, 0, 0, 0, 3, 67, N'Dance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (244, 0, 0, 0, 3, 68, N'Dodge & Escape', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (245, 0, 0, 0, 3, 69, N'Driving', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (246, 3, 0, 0, 3, 70, N'Fencing', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (247, 3, 0, 0, 3, 71, N'Handgun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (248, 0, 0, 0, 3, 72, N'Heavy Weapons', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (249, 0, 0, 0, 3, 73, N'Martial Arts', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (250, 0, 0, 0, 3, 74, N'Melee', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (251, 0, 0, 0, 3, 75, N'Motorcycle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (252, 0, 0, 0, 3, 76, N'Operate Heavy Machinery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (253, 0, 0, 0, 3, 77, N'Piloting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (254, 0, 0, 0, 3, 78, N'Pilot Gyro (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (255, 0, 0, 0, 3, 79, N'Pilot Fixed Wing(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (256, 0, 0, 0, 3, 80, N'Pilot Dirigible (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (257, 0, 0, 0, 3, 81, N'Pilot Vectored Thrust Vehicle (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (258, 0, 0, 0, 3, 82, N'Rifle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (259, 4, 0, 0, 3, 83, N'Stealth (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (260, 0, 0, 0, 3, 84, N'Submachinegun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (261, 0, 0, 0, 3, 85, N'Aero Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (262, 0, 0, 0, 3, 86, N'AV Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (263, 4, 0, 0, 3, 87, N'Basic Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (264, 0, 0, 0, 3, 88, N'Cryotank Operation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (265, 8, 0, 0, 3, 89, N'Cyberdeck Design (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (266, 2, 0, 0, 3, 90, N'CyberTech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (267, 0, 0, 0, 3, 91, N'Demolitions(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (268, 0, 0, 0, 3, 92, N'Disguise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (269, 2, 0, 0, 3, 93, N'Electronics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (270, 6, 0, 0, 3, 94, N'Electronic Security (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (271, 0, 0, 0, 3, 95, N'First Aid', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (272, 0, 0, 0, 3, 96, N'Forgery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (273, 0, 0, 0, 3, 97, N'Gyro Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (274, 0, 0, 0, 3, 98, N'Paint or Draw', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (275, 0, 0, 0, 3, 99, N'Photography 8 Film', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (276, 0, 0, 0, 3, 100, N'Pharmaceuticals (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (277, 0, 0, 0, 3, 101, N'Pick Lock', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (278, 0, 0, 0, 3, 102, N'Pick Pocket', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (279, 0, 0, 0, 3, 103, N'Play Instrument', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (280, 0, 0, 0, 3, 104, N'Weaponsmith (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (281, 0, 0, 0, 6, 12, N'Authority (Cops)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (282, 0, 0, 0, 6, 13, N'Charismatic Leadership (Rockers)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (283, 0, 0, 0, 6, 14, N'Combat Sense (Solos)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (284, 0, 0, 0, 6, 15, N'Credibility (Medias)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (285, 6, 0, 0, 6, 16, N'Family (Nomad)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (286, 0, 0, 0, 6, 17, N'Interface (Netrunner)', 0, 0)
GO
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (287, 0, 0, 0, 6, 18, N'Jury Rig (Techie)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (288, 0, 0, 0, 6, 19, N'Medical Tech (Medtech)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (289, 0, 0, 0, 6, 20, N'Resources (Corporate)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (290, 0, 0, 0, 6, 21, N'Streetdeal (Fixer)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (291, 0, 0, 0, 6, 22, N'Personal Grooming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (292, 0, 0, 0, 6, 23, N'Wardrobe & Style', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (293, 0, 0, 0, 6, 24, N'Endurance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (294, 0, 0, 0, 6, 25, N'Strength Feat', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (295, 0, 0, 0, 6, 26, N'Swimming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (296, 0, 0, 0, 6, 27, N'Interrogation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (297, 0, 0, 5, 6, 28, N'Intimidate', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (298, 0, 0, 0, 6, 29, N'Oratory', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (299, 0, 0, 0, 6, 30, N'ResistTorture/Drugs', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (300, 0, 0, 0, 6, 31, N'Streetwise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (301, 0, 0, 0, 6, 32, N'Human Perception', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (302, 0, 0, 0, 6, 33, N'Interview', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (303, 0, 0, 0, 6, 34, N'Leadership', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (304, 3, 0, 0, 6, 35, N'Seduction', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (305, 0, 0, 0, 6, 36, N'Social', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (306, 0, 0, 0, 6, 37, N'Persuasion & Fast Talk', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (307, 0, 0, 0, 6, 38, N'Perform', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (308, 0, 0, 0, 6, 39, N'Accounting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (309, 0, 0, 0, 6, 40, N'Anthropology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (310, 0, 0, 0, 6, 41, N'Awareness/Notice', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (311, 0, 0, 0, 6, 42, N'Biology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (312, 0, 0, 0, 6, 43, N'Botany', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (313, 0, 0, 0, 6, 44, N'Chemistry', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (314, 0, 0, 0, 6, 45, N'Composition', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (315, 3, 0, 0, 6, 46, N'Diagnose Illness', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (316, 0, 0, 0, 6, 47, N'Education 8 General Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (317, 0, 0, 0, 6, 48, N'Expert', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (318, 0, 0, 0, 6, 49, N'Gamb1e', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (319, 0, 0, 0, 6, 50, N'Geology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (320, 0, 0, 0, 6, 51, N'Hide/Evade', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (321, 0, 0, 0, 6, 52, N'History', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (322, 0, 0, 0, 6, 53, N'Know Language', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (323, 0, 0, 0, 6, 54, N'Library Search', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (324, 0, 0, 0, 6, 55, N'Mathematics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (325, 0, 0, 0, 6, 56, N'Physics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (326, 0, 0, 0, 6, 57, N'Programming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (327, 0, 0, 0, 6, 58, N'Shadow/Track', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (328, 0, 0, 0, 6, 59, N'Stock Market', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (329, 0, 0, 0, 6, 60, N'System Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (330, 0, 0, 0, 6, 61, N'Teaching', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (331, 0, 0, 0, 6, 62, N'Wilderness Survival', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (332, 0, 0, 0, 6, 63, N'Zoology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (333, 0, 0, 0, 6, 64, N'Archery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (334, 0, 0, 0, 6, 65, N'Athletics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (335, 0, 0, 0, 6, 66, N'Brawling', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (336, 0, 0, 0, 6, 67, N'Dance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (337, 0, 0, 0, 6, 68, N'Dodge & Escape', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (338, 0, 0, 0, 6, 69, N'Driving', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (339, 3, 0, 0, 6, 70, N'Fencing', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (340, 0, 0, 0, 6, 71, N'Handgun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (341, 0, 0, 0, 6, 72, N'Heavy Weapons', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (342, 2, 0, 0, 6, 73, N'Martial Arts', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (343, 0, 0, 0, 6, 74, N'Melee', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (344, 0, 0, 0, 6, 75, N'Motorcycle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (345, 0, 0, 0, 6, 76, N'Operate Heavy Machinery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (346, 0, 0, 0, 6, 77, N'Piloting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (347, 0, 0, 0, 6, 78, N'Pilot Gyro (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (348, 0, 0, 0, 6, 79, N'Pilot Fixed Wing(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (349, 3, 0, 0, 6, 80, N'Pilot Dirigible (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (350, 0, 0, 0, 6, 81, N'Pilot Vectored Thrust Vehicle (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (351, 0, 0, 0, 6, 82, N'Rifle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (352, 0, 0, 0, 6, 83, N'Stealth (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (353, 0, 0, 0, 6, 84, N'Submachinegun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (354, 0, 0, 0, 6, 85, N'Aero Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (355, 0, 0, 0, 6, 86, N'AV Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (356, 0, 0, 0, 6, 87, N'Basic Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (357, 0, 0, 0, 6, 88, N'Cryotank Operation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (358, 0, 0, 0, 6, 89, N'Cyberdeck Design (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (359, 0, 0, 0, 6, 90, N'CyberTech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (360, 3, 0, 0, 6, 91, N'Demolitions(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (361, 0, 0, 0, 6, 92, N'Disguise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (362, 2, 0, 0, 6, 93, N'Electronics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (363, 0, 0, 0, 6, 94, N'Electronic Security (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (364, 0, 0, 0, 6, 95, N'First Aid', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (365, 0, 0, 0, 6, 96, N'Forgery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (366, 0, 0, 0, 6, 97, N'Gyro Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (367, 0, 0, 0, 6, 98, N'Paint or Draw', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (368, 0, 0, 0, 6, 99, N'Photography 8 Film', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (369, 0, 0, 0, 6, 100, N'Pharmaceuticals (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (370, 0, 0, 0, 6, 101, N'Pick Lock', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (371, 0, 0, 0, 6, 102, N'Pick Pocket', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (372, 0, 0, 0, 6, 103, N'Play Instrument', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (373, 0, 0, 0, 6, 104, N'Weaponsmith (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (374, 0, 0, 0, 7, 12, N'Authority (Cops)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (375, 0, 0, 0, 7, 13, N'Charismatic Leadership (Rockers)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (376, 0, 0, 0, 7, 14, N'Combat Sense (Solos)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (377, 0, 0, 0, 7, 15, N'Credibility (Medias)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (378, 0, 0, 0, 7, 16, N'Family (Nomad)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (379, 0, 0, 0, 7, 17, N'Interface (Netrunner)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (380, 0, 0, 0, 7, 18, N'Jury Rig (Techie)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (381, 0, 0, 0, 7, 19, N'Medical Tech (Medtech)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (382, 0, 0, 0, 7, 20, N'Resources (Corporate)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (383, 0, 0, 0, 7, 21, N'Streetdeal (Fixer)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (384, 0, 0, 0, 7, 22, N'Personal Grooming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (385, 0, 0, 0, 7, 23, N'Wardrobe & Style', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (386, 0, 0, 0, 7, 24, N'Endurance', 0, 0)
GO
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (387, 0, 0, 0, 7, 25, N'Strength Feat', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (388, 0, 0, 0, 7, 26, N'Swimming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (389, 0, 0, 0, 7, 27, N'Interrogation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (390, 0, 0, 0, 7, 28, N'Intimidate', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (391, 0, 0, 0, 7, 29, N'Oratory', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (392, 0, 0, 0, 7, 30, N'ResistTorture/Drugs', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (393, 0, 0, 0, 7, 31, N'Streetwise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (394, 0, 0, 0, 7, 32, N'Human Perception', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (395, 0, 0, 0, 7, 33, N'Interview', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (396, 0, 0, 0, 7, 34, N'Leadership', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (397, 0, 0, 0, 7, 35, N'Seduction', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (398, 0, 0, 0, 7, 36, N'Social', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (399, 0, 0, 0, 7, 37, N'Persuasion & Fast Talk', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (400, 0, 0, 0, 7, 38, N'Perform', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (401, 0, 0, 0, 7, 39, N'Accounting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (402, 0, 0, 0, 7, 40, N'Anthropology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (403, 0, 0, 0, 7, 41, N'Awareness/Notice', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (404, 0, 0, 0, 7, 42, N'Biology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (405, 0, 0, 0, 7, 43, N'Botany', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (406, 0, 0, 0, 7, 44, N'Chemistry', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (407, 0, 0, 0, 7, 45, N'Composition', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (408, 0, 0, 0, 7, 46, N'Diagnose Illness', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (409, 0, 0, 0, 7, 47, N'Education 8 General Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (410, 0, 0, 0, 7, 48, N'Expert', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (411, 0, 0, 0, 7, 49, N'Gamb1e', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (412, 0, 0, 0, 7, 50, N'Geology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (413, 0, 0, 0, 7, 51, N'Hide/Evade', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (414, 0, 0, 0, 7, 52, N'History', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (415, 0, 0, 0, 7, 53, N'Know Language', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (416, 0, 0, 0, 7, 54, N'Library Search', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (417, 0, 0, 0, 7, 55, N'Mathematics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (418, 0, 0, 0, 7, 56, N'Physics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (419, 0, 0, 0, 7, 57, N'Programming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (420, 0, 0, 0, 7, 58, N'Shadow/Track', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (421, 0, 0, 0, 7, 59, N'Stock Market', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (422, 0, 0, 0, 7, 60, N'System Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (423, 0, 0, 0, 7, 61, N'Teaching', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (424, 0, 0, 0, 7, 62, N'Wilderness Survival', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (425, 0, 0, 0, 7, 63, N'Zoology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (426, 0, 0, 0, 7, 64, N'Archery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (427, 0, 0, 0, 7, 65, N'Athletics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (428, 0, 0, 0, 7, 66, N'Brawling', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (429, 0, 0, 0, 7, 67, N'Dance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (430, 0, 0, 0, 7, 68, N'Dodge & Escape', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (431, 0, 0, 0, 7, 69, N'Driving', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (432, 0, 0, 0, 7, 70, N'Fencing', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (433, 0, 0, 0, 7, 71, N'Handgun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (434, 0, 0, 0, 7, 72, N'Heavy Weapons', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (435, 0, 0, 0, 7, 73, N'Martial Arts', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (436, 0, 0, 0, 7, 74, N'Melee', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (437, 0, 0, 0, 7, 75, N'Motorcycle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (438, 0, 0, 0, 7, 76, N'Operate Heavy Machinery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (439, 0, 0, 0, 7, 77, N'Piloting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (440, 0, 0, 0, 7, 78, N'Pilot Gyro (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (441, 0, 0, 0, 7, 79, N'Pilot Fixed Wing(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (442, 0, 0, 0, 7, 80, N'Pilot Dirigible (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (443, 0, 0, 0, 7, 81, N'Pilot Vectored Thrust Vehicle (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (444, 0, 0, 0, 7, 82, N'Rifle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (445, 0, 0, 0, 7, 83, N'Stealth (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (446, 0, 0, 0, 7, 84, N'Submachinegun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (447, 0, 0, 0, 7, 85, N'Aero Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (448, 0, 0, 0, 7, 86, N'AV Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (449, 0, 0, 0, 7, 87, N'Basic Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (450, 0, 0, 0, 7, 88, N'Cryotank Operation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (451, 0, 0, 0, 7, 89, N'Cyberdeck Design (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (452, 0, 0, 0, 7, 90, N'CyberTech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (453, 0, 0, 0, 7, 91, N'Demolitions(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (454, 0, 0, 0, 7, 92, N'Disguise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (455, 0, 0, 0, 7, 93, N'Electronics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (456, 0, 0, 0, 7, 94, N'Electronic Security (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (457, 0, 0, 0, 7, 95, N'First Aid', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (458, 0, 0, 0, 7, 96, N'Forgery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (459, 0, 0, 0, 7, 97, N'Gyro Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (460, 0, 0, 0, 7, 98, N'Paint or Draw', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (461, 0, 0, 0, 7, 99, N'Photography 8 Film', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (462, 0, 0, 0, 7, 100, N'Pharmaceuticals (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (463, 0, 0, 0, 7, 101, N'Pick Lock', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (464, 0, 0, 0, 7, 102, N'Pick Pocket', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (465, 0, 0, 0, 7, 103, N'Play Instrument', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (466, 0, 0, 0, 7, 104, N'Weaponsmith (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (467, 0, 0, 0, 7, 105, N'Corporate Policy', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (468, 0, 0, 0, 8, 12, N'Authority (Cops)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (469, 0, 0, 0, 8, 13, N'Charismatic Leadership (Rockers)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (470, 0, 0, 0, 8, 14, N'Combat Sense (Solos)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (471, 0, 0, 0, 8, 15, N'Credibility (Medias)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (472, 0, 0, 0, 8, 16, N'Family (Nomad)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (473, 0, 0, 0, 8, 17, N'Interface (Netrunner)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (474, 0, 0, 0, 8, 18, N'Jury Rig (Techie)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (475, 0, 0, 0, 8, 19, N'Medical Tech (Medtech)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (476, 0, 0, 0, 8, 20, N'Resources (Corporate)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (477, 0, 0, 0, 8, 21, N'Streetdeal (Fixer)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (478, 0, 0, 0, 8, 22, N'Personal Grooming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (479, 0, 0, 0, 8, 23, N'Wardrobe & Style', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (480, 0, 0, 0, 8, 24, N'Endurance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (481, 0, 0, 0, 8, 25, N'Strength Feat', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (482, 0, 0, 0, 8, 26, N'Swimming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (483, 0, 0, 0, 8, 27, N'Interrogation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (484, 0, 0, 0, 8, 28, N'Intimidate', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (485, 0, 0, 0, 8, 29, N'Oratory', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (486, 0, 0, 0, 8, 30, N'ResistTorture/Drugs', 0, 0)
GO
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (487, 0, 0, 0, 8, 31, N'Streetwise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (488, 0, 0, 0, 8, 32, N'Human Perception', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (489, 0, 0, 0, 8, 33, N'Interview', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (490, 0, 0, 0, 8, 34, N'Leadership', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (491, 0, 0, 0, 8, 35, N'Seduction', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (492, 0, 0, 0, 8, 36, N'Social', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (493, 0, 0, 0, 8, 37, N'Persuasion & Fast Talk', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (494, 0, 0, 0, 8, 38, N'Perform', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (495, 0, 0, 0, 8, 39, N'Accounting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (496, 0, 0, 0, 8, 40, N'Anthropology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (497, 0, 0, 0, 8, 41, N'Awareness/Notice', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (498, 0, 0, 0, 8, 42, N'Biology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (499, 0, 0, 0, 8, 43, N'Botany', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (500, 0, 0, 0, 8, 44, N'Chemistry', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (501, 0, 0, 0, 8, 45, N'Composition', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (502, 0, 0, 0, 8, 46, N'Diagnose Illness', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (503, 0, 0, 0, 8, 47, N'Education 8 General Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (504, 0, 0, 0, 8, 48, N'Expert', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (505, 0, 0, 0, 8, 49, N'Gamb1e', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (506, 0, 0, 0, 8, 50, N'Geology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (507, 0, 0, 0, 8, 51, N'Hide/Evade', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (508, 0, 0, 0, 8, 52, N'History', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (509, 0, 0, 0, 8, 53, N'Know Language', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (510, 0, 0, 0, 8, 54, N'Library Search', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (511, 0, 0, 0, 8, 55, N'Mathematics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (512, 0, 0, 0, 8, 56, N'Physics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (513, 0, 0, 0, 8, 57, N'Programming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (514, 0, 0, 0, 8, 58, N'Shadow/Track', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (515, 0, 0, 0, 8, 59, N'Stock Market', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (516, 0, 0, 0, 8, 60, N'System Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (517, 0, 0, 0, 8, 61, N'Teaching', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (518, 0, 0, 0, 8, 62, N'Wilderness Survival', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (519, 0, 0, 0, 8, 63, N'Zoology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (520, 0, 0, 0, 8, 64, N'Archery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (521, 0, 0, 0, 8, 65, N'Athletics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (522, 0, 0, 0, 8, 66, N'Brawling', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (523, 0, 0, 0, 8, 67, N'Dance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (524, 0, 0, 0, 8, 68, N'Dodge & Escape', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (525, 0, 0, 0, 8, 69, N'Driving', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (526, 0, 0, 0, 8, 70, N'Fencing', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (527, 0, 0, 0, 8, 71, N'Handgun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (528, 0, 0, 0, 8, 72, N'Heavy Weapons', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (529, 0, 0, 0, 8, 73, N'Martial Arts', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (530, 0, 0, 0, 8, 74, N'Melee', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (531, 0, 0, 0, 8, 75, N'Motorcycle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (532, 0, 0, 0, 8, 76, N'Operate Heavy Machinery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (533, 0, 0, 0, 8, 77, N'Piloting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (534, 0, 0, 0, 8, 78, N'Pilot Gyro (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (535, 0, 0, 0, 8, 79, N'Pilot Fixed Wing(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (536, 0, 0, 0, 8, 80, N'Pilot Dirigible (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (537, 0, 0, 0, 8, 81, N'Pilot Vectored Thrust Vehicle (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (538, 0, 0, 0, 8, 82, N'Rifle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (539, 0, 0, 0, 8, 83, N'Stealth (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (540, 0, 0, 0, 8, 84, N'Submachinegun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (541, 0, 0, 0, 8, 85, N'Aero Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (542, 0, 0, 0, 8, 86, N'AV Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (543, 0, 0, 0, 8, 87, N'Basic Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (544, 0, 0, 0, 8, 88, N'Cryotank Operation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (545, 0, 0, 0, 8, 89, N'Cyberdeck Design (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (546, 0, 0, 0, 8, 90, N'CyberTech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (547, 0, 0, 0, 8, 91, N'Demolitions(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (548, 0, 0, 0, 8, 92, N'Disguise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (549, 0, 0, 0, 8, 93, N'Electronics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (550, 0, 0, 0, 8, 94, N'Electronic Security (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (551, 0, 0, 0, 8, 95, N'First Aid', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (552, 0, 0, 0, 8, 96, N'Forgery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (553, 0, 0, 0, 8, 97, N'Gyro Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (554, 0, 0, 0, 8, 98, N'Paint or Draw', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (555, 0, 0, 0, 8, 99, N'Photography 8 Film', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (556, 0, 0, 0, 8, 100, N'Pharmaceuticals (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (557, 0, 0, 0, 8, 101, N'Pick Lock', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (558, 0, 0, 0, 8, 102, N'Pick Pocket', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (559, 0, 0, 0, 8, 103, N'Play Instrument', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (560, 0, 0, 0, 8, 104, N'Weaponsmith (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (561, 0, 0, 0, 8, 105, N'Corporate Policy', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (562, 0, 0, 0, 9, 12, N'Authority (Cops)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (563, 0, 0, 0, 9, 13, N'Charismatic Leadership (Rockers)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (564, 0, 0, 0, 9, 14, N'Combat Sense (Solos)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (565, 0, 0, 0, 9, 15, N'Credibility (Medias)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (566, 4, 0, 0, 9, 16, N'Family (Nomad)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (567, 0, 0, 0, 9, 17, N'Interface (Netrunner)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (568, 0, 0, 0, 9, 18, N'Jury Rig (Techie)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (569, 0, 0, 0, 9, 19, N'Medical Tech (Medtech)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (570, 4, 0, 0, 9, 20, N'Resources (Corporate)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (571, 0, 0, 0, 9, 21, N'Streetdeal (Fixer)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (572, 0, 0, 0, 9, 22, N'Personal Grooming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (573, 0, 0, 0, 9, 23, N'Wardrobe & Style', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (574, 4, 0, 0, 9, 24, N'Endurance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (575, 0, 0, 0, 9, 25, N'Strength Feat', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (576, 0, 0, 0, 9, 26, N'Swimming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (577, 0, 0, 0, 9, 27, N'Interrogation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (578, 0, 0, 0, 9, 28, N'Intimidate', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (579, 0, 0, 0, 9, 29, N'Oratory', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (580, 0, 0, 0, 9, 30, N'ResistTorture/Drugs', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (581, 2, 0, 0, 9, 31, N'Streetwise', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (582, 0, 0, 0, 9, 32, N'Human Perception', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (583, 0, 0, 0, 9, 33, N'Interview', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (584, 0, 0, 0, 9, 34, N'Leadership', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (585, 0, 0, 0, 9, 35, N'Seduction', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (586, 0, 0, 0, 9, 36, N'Social', 0, 0)
GO
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (587, 2, 0, 0, 9, 37, N'Persuasion & Fast Talk', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (588, 0, 0, 0, 9, 38, N'Perform', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (589, 0, 0, 0, 9, 39, N'Accounting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (590, 0, 0, 0, 9, 40, N'Anthropology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (591, 4, 0, 0, 9, 41, N'Awareness/Notice', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (592, 0, 0, 0, 9, 42, N'Biology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (593, 0, 0, 0, 9, 43, N'Botany', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (594, 0, 0, 0, 9, 44, N'Chemistry', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (595, 0, 0, 0, 9, 45, N'Composition', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (596, 0, 0, 0, 9, 46, N'Diagnose Illness', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (597, 2, 0, 0, 9, 47, N'Education 8 General Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (598, 0, 0, 0, 9, 48, N'Expert', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (599, 0, 0, 0, 9, 49, N'Gamb1e', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (600, 0, 0, 0, 9, 50, N'Geology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (601, 4, 0, 0, 9, 51, N'Hide/Evade', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (602, 0, 0, 0, 9, 52, N'History', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (603, 0, 0, 0, 9, 53, N'Know Language', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (604, 0, 0, 0, 9, 54, N'Library Search', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (605, 0, 0, 0, 9, 55, N'Mathematics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (606, 0, 0, 0, 9, 56, N'Physics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (607, 0, 0, 0, 9, 57, N'Programming', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (608, 1, 0, 0, 9, 58, N'Shadow/Track', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (609, 0, 0, 0, 9, 59, N'Stock Market', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (610, 0, 0, 0, 9, 60, N'System Knowledge', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (611, 0, 0, 0, 9, 61, N'Teaching', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (612, 2, 0, 0, 9, 62, N'Wilderness Survival', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (613, 0, 0, 0, 9, 63, N'Zoology', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (614, 0, 0, 0, 9, 64, N'Archery', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (615, 6, 0, 0, 9, 65, N'Athletics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (616, 0, 0, 0, 9, 66, N'Brawling', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (617, 0, 0, 0, 9, 67, N'Dance', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (618, 1, 0, 0, 9, 68, N'Dodge & Escape', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (619, 4, 0, 0, 9, 69, N'Driving', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (620, 0, 0, 0, 9, 70, N'Fencing', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (621, 3, 0, 0, 9, 71, N'Handgun', 0, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (622, 0, 0, 0, 9, 72, N'Heavy Weapons', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (623, 0, 0, 0, 9, 73, N'Martial Arts', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (624, 0, 0, 0, 9, 74, N'Melee', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (625, 6, 0, 0, 9, 75, N'Motorcycle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (626, 3, 0, 0, 9, 76, N'Operate Heavy Machinery', 0, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (627, 0, 0, 0, 9, 77, N'Piloting', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (628, 4, 0, 0, 9, 78, N'Pilot Gyro (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (629, 4, 0, 0, 9, 79, N'Pilot Fixed Wing(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (630, 0, 0, 0, 9, 80, N'Pilot Dirigible (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (631, 3, 0, 0, 9, 81, N'Pilot Vectored Thrust Vehicle (3)', 0, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (632, 0, 0, 0, 9, 82, N'Rifle', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (633, 4, 0, 0, 9, 83, N'Stealth (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (634, 4, 0, 0, 9, 84, N'Submachinegun', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (635, 0, 0, 0, 9, 85, N'Aero Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (636, 0, 0, 0, 9, 86, N'AV Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (637, 2, 0, 0, 9, 87, N'Basic Tech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (638, 0, 0, 0, 9, 88, N'Cryotank Operation', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (639, 0, 0, 0, 9, 89, N'Cyberdeck Design (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (640, 0, 0, 0, 9, 90, N'CyberTech (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (641, 0, 0, 0, 9, 91, N'Demolitions(2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (642, 3, 0, 0, 9, 92, N'Disguise', 0, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (643, 0, 0, 0, 9, 93, N'Electronics', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (644, 0, 0, 0, 9, 94, N'Electronic Security (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (645, 4, 0, 0, 9, 95, N'First Aid', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (646, 3, 0, 0, 9, 96, N'Forgery', 0, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (647, 0, 0, 0, 9, 97, N'Gyro Tech (3)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (648, 0, 0, 0, 9, 98, N'Paint or Draw', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (649, 0, 0, 0, 9, 99, N'Photography 8 Film', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (650, 0, 0, 0, 9, 100, N'Pharmaceuticals (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (651, 0, 0, 0, 9, 101, N'Pick Lock', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (652, 0, 0, 0, 9, 102, N'Pick Pocket', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (653, 0, 0, 0, 9, 103, N'Play Instrument', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (654, 0, 0, 0, 9, 104, N'Weaponsmith (2)', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (655, 0, 0, 0, 9, 105, N'Corporate Policy', 0, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (656, 4, 0, 0, 3, 110, N'Know Language(German)', 1, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (657, 3, 0, 0, 3, 110, N'Know Language(Japanese)', 1, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (658, 4, 0, 0, 3, 110, N'Know Language(Street Slang)', 1, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (659, 3, 0, 0, 9, 110, N'Expert(Corp Policy)', 1, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (660, 2, 0, 0, 9, 110, N'Know Language(Street Slang)', 1, 0)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (661, 3, 0, 0, 9, 110, N'Know Language(Russian)', 1, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (662, 3, 0, 0, 9, 110, N'Know Language(Japanese)', 1, 1)
INSERT [dbo].[PlayerSkill] ([id], [Ranks], [Bonus], [CurrentIP], [PlayerID], [SkillID], [Name], [IsCustom], [IsChipped]) VALUES (663, 6, 0, 0, 9, 111, N'Martial Arts(Karate)', 1, 0)
SET IDENTITY_INSERT [dbo].[PlayerSkill] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerStat] ON 

INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (1, 1, 10, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (2, 2, 10, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (3, 3, 5, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (4, 4, 10, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (5, 5, 10, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (6, 6, 8, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (7, 7, 6, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (8, 8, 1, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (9, 9, 10, 0, 0, 3)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (10, 1, 10, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (11, 2, 10, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (12, 3, 1, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (13, 4, 0, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (14, 5, 0, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (15, 6, 0, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (16, 7, 0, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (17, 8, 0, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (18, 9, 10, 0, 0, 6)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (19, 1, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (20, 2, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (21, 3, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (22, 4, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (23, 5, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (24, 6, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (25, 7, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (26, 8, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (27, 9, NULL, NULL, NULL, 7)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (28, 1, 1, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (29, 2, NULL, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (30, 3, 10, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (31, 4, NULL, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (32, 5, NULL, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (33, 6, 5, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (34, 7, NULL, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (35, 8, NULL, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (36, 9, NULL, NULL, NULL, 8)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (37, 1, 8, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (38, 2, 10, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (39, 3, 6, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (40, 4, 6, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (41, 5, 10, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (42, 6, 10, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (43, 7, 8, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (44, 8, 5, NULL, NULL, 9)
INSERT [dbo].[PlayerStat] ([id], [StatID], [Base], [Bonus], [Current], [PlayerID]) VALUES (45, 9, 7, NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[PlayerStat] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerStatModifiers] ON 

INSERT [dbo].[PlayerStatModifiers] ([id], [PlayerStatID], [name], [amount]) VALUES (3, 9, N'HL', 0)
INSERT [dbo].[PlayerStatModifiers] ([id], [PlayerStatID], [name], [amount]) VALUES (4, 2, N'Torso Plate', -3)
INSERT [dbo].[PlayerStatModifiers] ([id], [PlayerStatID], [name], [amount]) VALUES (5, 2, N'Jacket', -1)
SET IDENTITY_INSERT [dbo].[PlayerStatModifiers] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerWeapon] ON 

INSERT [dbo].[PlayerWeapon] ([id], [PlayerID], [Name], [NumDice], [DiceType], [Bonus], [ROF], [REL], [Type], [Conc], [Shots1], [Shots2], [Range], [Description]) VALUES (1, 3, N'Mustang Arms MkII', 3, 6, 0, 3, 1, 1, 1, 12, 20, 50, N'Mustang Arms Mark 2.')
INSERT [dbo].[PlayerWeapon] ([id], [PlayerID], [Name], [NumDice], [DiceType], [Bonus], [ROF], [REL], [Type], [Conc], [Shots1], [Shots2], [Range], [Description]) VALUES (2, 3, N'Monoblade', 2, 6, 1, 1, 1, 2, 2, 0, 0, 0, N'Monoblade')
SET IDENTITY_INSERT [dbo].[PlayerWeapon] OFF
GO
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (1, N'Hammer', 4, 1, 400, 1, N'2D6 to Data Wall STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (2, N'Jackhammer', 2, 1, 360, 2, N'1D6 to Data Wall STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (3, N'Pile Driver', 8, 1, 800, 4, N'4D6 to Data Wall STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (4, N'Portal', 2, 1, 750, 6, N'Opens door in Data Wall', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (5, N'Sledgehammer', 6, 1, 600, 2, N'3D6 to Data Wall STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (6, N'Termite', 1, 1, 160, 2, N'1D6 to Data Wall STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (7, N'Worm', 2, 1, 660, 5, N'Opens Data Wall in 2 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (127, N'Codecracker', 3, 2, 380, 2, N'Opens Code Gates', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (128, N'Dupre', -1, 2, 900, 4, N'Opens Code Gates & File Locks', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (129, N'Raffles', 5, 2, 560, 4, N'Opens Code Gates & File Locks', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (130, N'Wizard''s Book', -1, 2, 400, 2, N'Opens Code Gates & File Locks', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (131, N'Bloodhound', 3, 3, 700, 5, N'Detects entry, traces, alerts master', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (132, N'Bulldog', 6, 3, 660, 6, N'Detects entry, alerts master, hangs up on intruder', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (133, N'Cry Baby', 4, 3, 430, 4, N'''Tags," adds 4 to traces when it''s copied', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (134, N'Clairvoyance', 4, 3, 720, 4, N'Detects and identifies ICONs within 2 subgrids; detects invisible ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (135, N'Guard Dog', 4, 3, 720, 5, N'Invisible; detects entry, alerts master', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (136, N'Hidden Virtue', 3, 3, 280, 1, N'Detects "real" things in VRs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (137, N'Looking Glass 1', 1, 3, 270, 3, N'Detects disguised ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (138, N'Looking Glass 2', 2, 3, 270, 3, N'Detects disguised ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (139, N'Looking Glass 3', 3, 3, 270, 3, N'Detects disguised ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (140, N'Looking Glass 4', 4, 3, 270, 3, N'Detects disguised ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (141, N'Looking Glass 5', 5, 3, 270, 3, N'Detects disguised ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (142, N'Looking Glass 6', 6, 3, 270, 3, N'Detects disguised ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (143, N'Pit Bull', 2, 3, 780, 6, N'Detects entry, traces, hangs up on target until destroyed', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (144, N'Seeya', 3, 3, 280, 1, N'Detects invisible ICONs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (145, N'Shadow', 4, 3, 540, 3, N'Degrades evasion programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (146, N'Smarteye', 3, 3, 620, 4, N'Detects programs within 10 spaces,identifies attack programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (147, N'Speedtrap', 4, 3, 600, 4, N'Detects attack programs within 10 spaces', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (148, N'Watchdog', 4, 3, 610, 5, N'Detects entry, alerts owner', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (149, N'Cascade', 7, 4, 900, 4, N'Erases 2D6 MU of random memory', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (150, N'DecKRASH', 4, 4, 600, 2, N'Crashes cyberdecks for 1D6 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (151, N'Flatline', 3, 4, 570, 2, N'Kills cyberdeck interface', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (152, N'Grid Wave', 7, 4, 20000, 8, N'Distorts I-G algorithms', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (153, N'HellBurner', 6, 4, 1000, 5, N'Destroys target CPU', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (154, N'Krash', 3, 4, 570, 2, N'Crashes closest CPU for 1D6+1 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (155, N'Murphy', 3, 4, 600, 2, N'Causes system to randomly activate programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (156, N'Pi in the Face', 5, 4, 800, 4, N'Makes CPU calculate Pi', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (157, N'Poison Flatline', 2, 4, 540, 2, N'Kills system RAM', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (158, N'Swarm', 1, 4, 3000, 7, N'Causes target system to produce more Swarm programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (159, N'Typhoid Mary', 6, 4, 2400, 8, N'Infiltrates ''runner and deletes files', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (160, N'Weed', 2, 4, 630, 3, N'-1 target speed per successful attack', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (161, N'Virizz', 4, 4, 600, 2, N'Ties up 1 system action until turned off or destroyed', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (162, N'Viral 15', 4, 4, 590, 2, N'Randomly erases one file each turn', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (163, N'Black Mask 1', 1, 5, 200, 3, N'Makes your ICON look like something/one else', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (164, N'Black Mask 2', 2, 5, 200, 3, N'Makes your ICON look like something/one else', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (165, N'Black Mask 3', 3, 5, 200, 3, N'Makes your ICON look like something/one else', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (166, N'Black Mask 4', 4, 5, 200, 4, N'Makes your ICON look like something/one else', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (167, N'Black Mask 5', 5, 5, 200, 4, N'Makes your ICON look like something/one else', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (168, N'Domino', 5, 5, 1500, 3, N'Makes your ICON look like one common to the locale', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (169, N'George', 4, 5, 300, 1, N'Adds 4 to Trace Difficulty', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (170, N'Invisibility', 3, 5, 300, 1, N'Makes cybersignal invisible', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (171, N'Replicator', -1, 5, 320, 2, N'Confuses attacking ICE with millions of false signals', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (172, N'Spore', 7, 5, 2320, 7, N'Al suicide-replication, sending multiple copies of core program into Net to "reproduce:', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (173, N'Stealth', 4, 5, 480, 3, N'Mutes cybersignal, making detection harder', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (174, N'Superballs', 3, 5, 500, 4, N'Distracts target, causing -3 to initiative', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (175, N'Armor', 4, 6, 170, 2, N'Reduces Stun, Hel!bolt, Zombie, Brainwipe, Liche, and Hellhound attacks by 3 points.', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (176, N'DeckShield One', 6, 6, 320, 2, N'Adds +3 to deck''s Data Walls', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (177, N'Flak', -1, 6, 180, 2, N'Creates static wall to blind attackers;STR 2 vs. Dogs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (178, N'Force Shield', 4, 6, 160, 2, N'Stops attacks against ''runner', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (179, N'OutJack', 2, 6, 150, 4, N'Jacks ''runner out of Net if his body is at Critical physical damage level', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (180, N'Reflector', 5, 6, 160, 2, N'Reflects and stops Stun, Hellbolt, Knockout attacks', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (181, N'Shield', 3, 6, 150, 1, N'Stops attacks to ''runner', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (182, N'Aardvark', 4, 7, 1000, 3, N'Detects and destroys Worms', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (183, N'Bunnies', 4, 7, 440, 3, N'Overloads Vampyres', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (184, N'Chameleon', 4, 7, 1650, 6, N'Killer IV with active Disguise', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (185, N'Dogcatcher', 10, 7, 1176, 7, N'Chases and destroys tracing "Dogs"', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (186, N'Dragon', 4, 7, 960, 3, N'Attacks and derezzes Demons', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (187, N'Eradicator', 5, 7, 1600, 7, N'Acts as Killer V, destroys Al spores', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (188, N'Exorcist', 4, 7, 600, 3, N'Removes effects of Possession', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (189, N'Hydra', 3, 7, 920, 3, N'Attacks and derezzes Demons', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (190, N'Killer II', 2, 7, 1320, 5, N'1D6 to any program STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (191, N'Killer VI', 6, 7, 1400, 5, N'1D6 to any program STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (192, N'Killer IV', 4, 7, 1480, 5, N'1D6 to any program STR', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (193, N'Manticore', 2, 7, 880, 3, N'Attacks and derezzes Demons', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (194, N'Mirror', 5, 7, 1200, 4, N'Rebounds Hellbolts', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (195, N'Ninja', 5, 7, 1520, 5, N'Invisible Killer', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (196, N'Possessor', 4, 7, 1000, 3, N'"Possesses" programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (197, N'Raven', 5, 7, 1000, 4, N'"Blinds" any program', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (198, N'Wolf', 4, 7, 1500, 6, N'Killer disguised as Watchdog', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (199, N'Ball and Chain', 3, 8, 5000, 3, N'Slows ''runner''s movement to 1 square for 1D6+3 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (200, N'Brainwipe', 3, 8, 6500, 4, N'Reduce INT by 1D-6/turn, killing ''runner', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (201, N'Cerebus', 6, 8, 9500, 8, N'Pit Bull that shoots Hellbolts', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (202, N'Fatal Attractor', 7, 8, 10750, 7, N'Attractively disguised Hellhound', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (203, N'Firestarter', 4, 8, 6250, 4, N'Power surge electrocutes ''runner', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (204, N'Glue', 5, 8, 6500, 4, N'Locks ''runner in place 1D10 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (205, N'Hellbolt', 4, 8, 6750, 4, N'1D10 physical damage to ''runner', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (206, N'Hellhound', 6, 8, 10000, 6, N'Tracks target, waits, causes heart attack', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (207, N'Jack Attack', 3, 8, 6000, 3, N'''Runner can''t log off for 1D6 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (208, N'King Trail', 3, 8, 3500, 2, N'Leaves glowing trail behind ''runner for 3D6 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (209, N'Knockout', 4, 8, 6250, 3, N'Causes coma for 1D6 hours', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (210, N'Liche', 4, 8, 7250, 4, N'Erases ''runner''s memory and over-writes personality', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (211, N'Pepe Le Pue', 6, 8, 7750, 5, N'Reduces ''runners INT and REF for 1D6+1 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (212, N'Psychodrome', 4, 8, 14000, 11, N'Causes unconsciousness for 1D6 hours and scares victim', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (213, N'Red-Out', 5, 8, 6750, 4, N'Paralyzes ''runner for 1D6 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (214, N'Spazz', 4, 8, 6250, 3, N'Halves ''runner REF 1D6 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (215, N'Stationery', 4, 8, 10000, 6, N'Prevents ''runner from moving for five turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (216, N'Stun', 3, 8, 6000, 3, N'Freezes ''runner 1D6 turns', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (217, N'Sword', 3, 8, 6250, 4, N'1D6 physical damage to target', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (218, N'Threat', 5, 8, 7000, 6, N'Makes ''runner so nervous he jacks out', 0)
GO
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (219, N'Werewolf', 6, 8, 13000, 6, N'Invisible Hellhound variant', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (220, N'Zombie', 5, 8, 7500, 4, N'Reduce INT 1D6/turn, making ''runner mindless', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (221, N'The Audio Virus', 5, 8, 8000, 5, N'Reduces INT and REF until ''runner nukes program', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (222, N'A Picture''s Worth', 2, 9, 1200, 6, N'Hides data within VRs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (223, N'Black Sky', 5, 9, 4480, 8, N'Hides ''runner in a cloud which attacks programs with "lightning"', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (224, N'Dummy', 1, 9, 450, 2, N'Fake, disguisable program', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (225, N'Evil Twin', 8, 9, 2700, 7, N'Combination shield/krash', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (226, N'IGOR', 4, 9, 4800, 7, N'On-line flunky', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (227, N'Lightning Bug', 2, 9, 1540, 6, N'6 "bugs" that sally forth to kill ICE before it can attack', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (228, N'Omnivore', 3, 9, 18500, 8, N'Derezzes programs, fries CPU chips, temporarily reduces ''runner''s INT by 2D6', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (229, N'Scribe', 6, 9, 0, 8, N'Stops and disassembles programs for copying', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (230, N'Wolfpack', 6, 9, 15200, 8, N'Does 1D6 darriage to program and Demon STR; does 1D10 damage to ''runners', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (231, N'Crystal Ball', 4, 10, 140, 1, N'Operates cameras, sensors', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (232, N'Dee-2', 3, 10, 130, 1, N'Operates robotics', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (233, N'Genie', 5, 10, 150, 1, N'Operates doors, elevators', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (234, N'Hotwire', 3, 10, 130, 1, N'Operates remote vehicles', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (235, N'Knevil', 4, 10, 220, 3, N'Operates remote vehicles on its own', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (236, N'News At 8', 4, 10, 140, 1, N'Allows access to data terms and screamsheets through the Net', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (237, N'Open Sesame''', 3, 10, 130, 1, N'Weaker program to operate doors, elevators', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (238, N'Phone Home', 5, 10, 150, 1, N'Can place/receive calls while in the Net', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (239, N'Rockerbit', 4, 10, 200, 2, N'Operates microphones/voxboxes on its own', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (240, N'Soundmachine', 4, 10, 140, 1, N'Controls mikes, speakers, etc.', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (241, N'Terminator', 4, 10, 260, 2, N'Control terminals', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (242, N'Viddy Master', 4, 10, 140, 1, N'Controls videoboards, etc.', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (243, N'Alias', 6, 11, 160, 2, N'Replaces file names', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (244, N'Backup', 4, 11, 140, 1, N'Used to copy programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (245, N'Breadcrumbs', 4, 11, 290, 4, N'Finds new LDL link routes', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (246, N'Cartographer', 6, 11, 200, 3, N'Maps out data forts', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (247, N'Databaser', 8, 11, 180, 2, N'Opens files to store info', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (248, N'Dolphin Programs', 3, 11, 310, 5, N'Clean Pacifica of junk data', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (249, N'ElectroLock', 7, 11, 170, 2, N'Locks files to File Lock 3', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (250, N'Filelocker', 4, 11, 140, 1, N'Locks files to Code Gate 5', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (251, N'File Packer', 4, 11, 140, 1, N'Packs files to 1/2 size', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (252, N'Flare Gun', 2, 11, 300, 2, N'Sends out Net distress signal', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (253, N'Flip Switch 2.0', 10, 11, 225, 0, N'Flip Switch controller', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (254, N'Flip Switch 3.0', 10, 11, 250, 0, N'Flip Switch glogo controller', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (255, N'GateMaster', 5, 11, 150, 1, N'Anti-virus program!', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (256, N'Guest Book', 4, 11, 200, 2, N'Area observation program', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (257, N'Instant Replay', 8, 11, 180, 2, N'Records ''runner''s trip', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (258, N'Multinetter', 10, 11, 2000, 20, N'Allows multiple ''runners to run through one computer', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (259, N'NetMap', 4, 11, 150, 1, N'Major region locator map', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (260, N'Padlock', 4, 11, 160, 2, N'Codeword has to be given to log onto the deck', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (261, N'Re-Rezz', 3, 11, 130, 1, N'Restores destroyed programs and files', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (262, N'Translator 2000', 4, 11, 240, 2, N'Takes pictures to make virtual objects', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (263, N'Afreet II', 3, 12, 1160, 4, N'Carries 3 programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (264, N'Balron II', 5, 12, 1240, 5, N'Carries 4 programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (265, N'Imp II', 3, 12, 1000, 3, N'Carries 2 programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (266, N'Succubus II', 4, 12, 1200, 4, N'Carries 4 programs', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (267, N'Vampyre II', 6, 12, 2300, 7, N'Vampyre is an extremely powerful variant on the Demon series of compiler programs, credited to the notorious Waycon Kidd. Very expensive and rare, Vampyre dismantles any target program it attacks, adding the victim''s abilities to itself. The only type of programs Vampyre cannot absorb are other Demons and programs involving virtual realities (such as Psychodrome).
When Vampyre attacks a program, it rewrites the program into itself as one-time code, so that every program "eaten" by a Vampyre (up to a total of 6) can then be used by that Vampyre once, and then it is erased. This constant re-writing of code lines and activation of subroutines does put a strain on the program''s logic systems, however: every time you activate one of the absorbed programs you must roll a D10 greater than the current number of programs stored. Failure means that the Vampyre has "crashed," purging all its stored programs, and rendering it useless until the ''runner leaves the net, removes the Vampyre from his deck, and reinstalls it.
ICON: A cadaverous figure in gray robes, with golden orbs for eyes, and a snarling mouth baring golden fangs. When it attacks, it transforms into a misty gray cloud, shot through with sparkling red lights. This cloud then covers and dissolves the other program''s icon. (Chromebook 1)', 0)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (268, N'Pokeball', 4, 7, 1200, 4, N'Targets program and does 1d6 damage to strength, if this reduces the target to 0, and there is room on the user''s cyberdeck, the target is added to the user''s cyberdeck, this program deletes itself after use', 1)
INSERT [dbo].[Program] ([id], [name], [Strength], [ProgramTypeID], [cost], [MU], [Description], [isCustom]) VALUES (269, N'Multi-Tasker', 5, 11, 1140, 6, N'Allows for netrunning with mainframe', 0)
SET IDENTITY_INSERT [dbo].[Program] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramFunctions] ON 

INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (1, N'Alarm', N'this function alerts the system or
Netrunner to intrusion', 15)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (2, N'Evasion', N': this function makes a program or
the runner hard to trace', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (3, N'Stealth', N': this function makes the program
or runner hard to detect', 15)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (4, N'Anti Program', N'this function attacks and
destroys other programs', 20)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (5, N'Anti System', N' this function damages or
screws up a computer system. ', 15)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (6, N'Detection', N': this function detects intruding
netrunnen/programs ', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (7, N'Anti-Personnel', N' this function attacks and
kills Netrunners. The Netrunner is either
killed (takes damage), taken over or mind
wiped.', 20)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (8, N'Intrusion', N': this function allows programs/
netrunnen to get through data walls.
Protection: this function stops attacks to
netrunners or decks', 15)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (9, N'Decryption', N'this function opens codes and
lock', 15)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (10, N'Controller', N': this function allows control of
machines in Realspace. ', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (11, N'Utility', N'this function restores damaged
programs, copies things, improves deck
speeds, reads files and does general librarian work. ', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (12, N'Anti-Compiler (Assassin)', N'destroys compilers (Demons and Daemons).
.	Normal anti-program programs can attack a Demon/ Daemon''s sub-programs, but
cannot affect the compiler itself!', 20)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (13, N'Compiler (Demon/Daemon)', N'this program manages other programs, and can reduce them in size by packing them tighter until needed.', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (14, N'Disguise', N'this program can disguise itself as another program.', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (15, N'Doppleganger', N' this program can take on the functions and appearance of a  program it''s just destroyed.', 20)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (16, N'Interactive', N'this program acts like a person in a virtual reality; it walks, moves
around, manipulates objects in the virtual
construct.When combined with psuedointellect and conversational ability, it can
act much like a real person inside a virtual
reality', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (17, N'Protection', N'this function stops attacks to Netrunners or decks if used successfully. For each +5 Difficutty, it stops 3 pointS of damage effect even if attack gets through.', 10)
INSERT [dbo].[ProgramFunctions] ([id], [name], [description], [diff]) VALUES (18, N'Software Editor', N'each one is different, and is pre-programmed to overwrite and rewrite a VR with whatever VR the programmer has given it.', 25)
SET IDENTITY_INSERT [dbo].[ProgramFunctions] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramOptions] ON 

INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (1, N'Movement ability', N'The program can move
freely throughout the Net while it''s main
programming remains in memory', 5)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (2, N'Trace', N': the program can follow another
program or netrunner through the Net. ', 2)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (3, N'Auto Re-Rez', N'the program can reconstruct
itself even if destroyed by rolling a 5 or 6
on 1D6.', 3)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (4, N'Recognition', N': the program can distinguish
between different netrunner signals and
programs. ', 2)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (5, N'Invisibility', N'the program is +2 Strength to
evade detection', 3)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (6, N'Memory', N': the program can remember
specific events and people. ', 5)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (7, N'Speed', N'the program adds +2 to deck speed
when it runs', 2)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (8, N'Endurance', N': the program is tireless and will
never quit unless destroyed', 3)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (9, N'Conversational ability', N'the program can
speak. ', 3)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (10, N'Pseudo-intellect', N'the program can think
like a real person of INT 6. ', 6)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (11, N'ICON (simple)', N' the program has a visible,
cartoon icon in the Net. ', 1)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (12, N'ICON (contextural', N'the program has a
Net ICON about the graphic level of a
high-res computer image. ', 2)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (13, N'ICON (fractal)', N'the program has some
what realistic Net ICON, with shading,
texture and sensation.', 3)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (14, N'ICON (photorealistic)', N'the program has a
very realistic ICON about tt I
good video image or movie', 4)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (15, N'ICON (superrealistic)', N' the proylaiil iias ai1
ICON that looks like a real person or object. ', 5)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (16, N'Code Optimization', N'cuts the program''s final MU size by 1/2 (round up).', 10)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (17, N'Hang Up', N'The program can sever the data connection between signals; if a ''runner is in a datafort and a program "hangs up" on him, the ''runner is suddenly dropped offline. The program must have the Alarm function to use this option.', 5)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (18, N'Noisy', N'this program produces "noise" that makes it easy to detect at great range.', -5)
INSERT [dbo].[ProgramOptions] ([id], [name], [description], [diff]) VALUES (19, N'One Use', N'the program derezzes after one use, whether successful or not.', -10)
SET IDENTITY_INSERT [dbo].[ProgramOptions] OFF
GO
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (4, 8)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (6, 8)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (130, 9)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (132, 1)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (132, 6)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (143, 1)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (143, 6)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (147, 6)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (157, 5)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (168, 3)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (170, 2)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (170, 3)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (171, 2)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (171, 3)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (173, 3)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (175, 17)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (178, 17)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (191, 4)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (195, 4)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (196, 4)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (205, 7)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (206, 7)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (209, 7)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (228, 4)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (228, 5)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (228, 7)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (231, 10)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (232, 10)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (233, 10)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (240, 10)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (241, 10)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (242, 10)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (243, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (244, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (245, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (246, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (247, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (248, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (249, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (250, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (251, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (252, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (253, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (254, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (255, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (256, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (257, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (258, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (259, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (260, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (261, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (262, 11)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (267, 7)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (267, 13)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (267, 16)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (268, 4)
INSERT [dbo].[ProgramProgramFunctions] ([ProgramID], [ProgramFunctionID]) VALUES (268, 15)
GO
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (4, 5)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (128, 6)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (132, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (132, 17)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (143, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (143, 2)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (143, 8)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (143, 17)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (191, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (195, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (195, 5)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (206, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (206, 2)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (206, 8)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (206, 10)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (228, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (267, 1)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (267, 4)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (267, 6)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (267, 9)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (267, 10)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (268, 18)
INSERT [dbo].[ProgramProgramOptions] ([ProgramID], [ProgramOptionsID]) VALUES (268, 19)
GO
SET IDENTITY_INSERT [dbo].[ProgramType] ON 

INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (1, N'Intrusion', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (2, N'Decryption', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (3, N'Detection/Alarm', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (4, N'Anti-System', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (5, N'Evasion/Stealth', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (6, N'Protection', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (7, N'Anti-Program', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (8, N'Anti-Personnel', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (9, N'Multi-Class', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (10, N'Controller', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (11, N'Utilitie', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (12, N'Demon', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (13, N'Daemon', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (14, N'Systemware', NULL)
INSERT [dbo].[ProgramType] ([id], [name], [Description]) VALUES (15, N'Transportation', NULL)
SET IDENTITY_INSERT [dbo].[ProgramType] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (12, N'Authority (Cops)', 1, 3, N'The ability to intimidate
or control others through your position as
a lawman. This attribute represents the
Cop’s ability to call on the forces of the Law
and Government to get what he wants.
Cops can use Authority to question suspects, arrest wrongdoers, and defend innocents. Backed by the power of Authority,
a cop can arrest, detain, confiscate and
enter nearly anywhere, as long as he has
the proper arrest or search warrants to back
his play. However, authority is only as
good as the guy holding the badge-if the
cop appears uncertain of his Authority,
there’s a good chance he’ll get nailed by
the people he’s trying to confront. The
higher your Authority, the more able you
are to face down criminals, particularly
high level mobsters and officials. Authority
is applied to your Cool stat.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (13, N'Charismatic Leadership (Rockers)', 1, 7, N'This
skill allowstheRockertoswaycrowdsequa1
to his level squared times 200. This ability
(added to your Cool stat) allows the Rockerboy to control, incite and charm large
number of people through his or her performance skills. When under the Rocker’s
control, this group can easily be persuaded
to act on his suggestions; for example, a
Rocker could convince a concert crowd to
riot in the streets or attack a heavily fortified
police line. Charismatic Leadership will only
work with groups of ten or more people as
it is primarily a mob leadership ability. The
higher your Charismatic Leadership, the
larger a crowd you can control and the
more direct and complex the instructions
you can get them to follow. For example, a
Level +3 Leadershipcould incite a nightclub
crowd to get rowdy. A Level +5 or +6 could
provoke a concert crowd of thousands to
trash a neighborhood, if the area wasn’t
too far from the hall. At Level +9, and
higher,you have thesamesortof mesmeric
ability as an Adolph Hitler-you can raise
armies, start movements, and destroy nations.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (14, N'Combat Sense (Solos)', 1, 3, N'This ability is based
on the Solo’s constant training and professionalism. Combat Sense allows the Solo
to perceive danger, notice traps, and have
an almost unearthly ability to avoid harm.
Your Combat Sense gives you a bonus on
both your Awareness skill and your Initiative equal to your level in the Combat
Sense skill.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (15, N'Credibility (Medias)', 1, 1, N'This is the ability to
be believed: by yourviewers, by the police,
by important and powerful people. This is
critical to getting your story heard and
acted upon, as well asconvincing people to
tell you things, give you information, or get
you into where the story is really happening. The higher your Credibility, the more
people you can convince, and the easier it
is to convince high level authorities of the
truth of your information. With a level +3
Credibility, you can convince most people
of minor scandals. With a level +5 or +6,
you can convince local officials of military
atrocities, undercover dealings and other
front page stuff. At level +9, you can
successfully expose a scandal of Watergate
proportions, or convince the President of
the EuroMarket Finance Board that aliens
are secretly influencing world leaders.
Credibility applies to your INT stat.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (16, N'Family (Nomad)', 1, 1, N'This is the ability to call
upon the resources and help of any of the
members of the Nomad’s large, extended
tribal family. This can be in the form of
weapons, cash, information, or a small
army of relatives. The threat of a Nomad
family’s vengeance may in itself stop harm
to the Nomad. The higher your Family
ability, the more important you are to the
Family and the more help you can call
upon. With a Family status of +2,you might
be able to get several of the Pack to help
you wreck a town, for example. With a
status of +7 or +8, you are able to make
major Pack decisions and lead troops. At
+10, you may be the Leader of your Pack.
Family is applied to your Intelligence stat.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (17, N'Interface (Netrunner)', 1, 1, N'This skill reflects
the Netrunner’s ability to manipulate Interface programs, and is the Skill used
when operating Menu functions such as
Locate Remote, Run Software, Control
Remote, Downlink , Load, Create and
Delete. Other players can enter the Net,
but cannot use the Menu. Interface is
based on the INT Stat. Note for Cyberpunk
l players- you may elect to swap your
original INT and REF stats for characters
generated with the old rule. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (18, N'Jury Rig (Techie)', 1, 1, N'This general repair skill
allows the Techie to temporarily repair or
alter anything for 1 D6 turns per level of
skill. This is not a permanent repair; after
the elapsed time, the jury rig will break
down. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (19, N'Medical Tech (Medtech)', 1, 1, N'This is the skill
used to perform major surgery and medical repairs. For more descriptions of this
skill in action, see Trauma Team, pg. 11 6.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (20, N'Resources (Corporate)', 1, 1, N'This represents
the Corporate’s ability to command corporation resources. It is used as a persuasion skill, based on the scale of resources
requested. This could include bodyguards,
weapons, vehicles, buildings, money, etc.
Obviously, the more powerful the Corporate, the more he can call upon at any one
time. Your level of Resources determines
exactly how much you can request from
the Corporation without overreaching
yourself. A Resource ability of +2 might get
you access to a Company car. An ability of
+6 might allow you to use a Company jet
or hire a Solo team from the Corporate
Security Division. A Resource of +9 would
allow you access to almost all levels of the
Corporation, as well as the ability to requisition almost any Company resource.Your
Resourceability is applied toyour INT stat. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (21, N'Streetdeal (Fixer)', 1, 3, N'This is the ability to
deal with the underground information
network. With Streetdeal, a Fixer can uncover rumors and information, locate
missing persons or things, put gossip out
on the Street, pick up clues and score big
deals.The higher your Streetdealability, the
more information you can gather about
things happening around you, the more
informants you have, and the more secretive the information you can dig up. A
level +3 Streetdealcan get you contactsfor
weapons, tools, or minor illegal operations. At level +5, you can penetrate the
secrets of all but the most powerful crime
families. At level +9, you are the equivalent of a Mafia crimelord yourself, privy to
every secret that''s on the Street. Apply
Streetdeal to your Cool stat. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (22, N'Personal Grooming', 2, 8, N'This is the skill of
knowing proper grooming, hair styling,
etc., to maximize your physical attractiveness. Use of this skill allows players to
increase their Attractiveness, and thus their
chances of successful Relationships or Persuasions. A basically good looking person
would be at +2. A fashion model might
have a Personal Grooming of +5 or +6. At
+8 or better, you could be a major fashion
model, film star, or trendsetter. You are
always "together". And you know it.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (23, N'Wardrobe & Style', 2, 8, N'The skill of knowing
the right clothes to wear, when to wear
them, and how to look cool even in a
spacesuit. With a Wardrobeof +2 or better,
you are good at choosing clothes off the
rack. At +6, your friends ask you for wardrobe tips, and you never buy anything off
the rack. At +8 or better, you are one of
those rare people whose personal style
influences major fashion trends. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (24, N'Endurance', 3, 6, N'This is the ability to withstand
pain or hardship, particularly over long
periods of time, by knowing the best ways
to conserve strength and energy. Endurance Skill checks would be made whenever a character must continue to be active aftera long period without food, sleep
or water', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (25, N'Strength Feat', 3, 6, N'The user of this skill has
practiced the art of bending bars, crushing objects, ripping phone books apart
and other useful parlor tricks. At +2 you
can crush cans, rip thin books in half, and
bend thin rods. At +8, no phonebook is
safe, you can bend thin rebar, and snap
handcuffs. At +lo, you can bend prison
bars, rip up the Cutenberg Bible, and dent
car fenders with one blow. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (26, N'Swimming', 3, 6, N'This skill is required to know
how to swim (see Athletics for details).', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (27, N'Interrogation', 4, 3, N'The skill of drawing
information from a subject and forcing
his secrets into the open. An lnterrogation
of +2 or better will allow you to infallibly
find out if your boyfriend is lying to you. At
+SI you are a professional level interrogator-equivalent to a skilled detective
grilling a suspect. Mike Wallace of 60
Minutes has an lnterrogation of +9, allowing him to make even the most powerful
people squirm. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (28, N'Intimidate', 4, 3, N'The skill of getting people to
do what you want by force of personality
or physical coercion. At +3, you can
frighten almost any typical citizen, politician or low-level thug. At +6, you can
intimidate Sylvester Stallone or any moderate "tough guy". At +9, you could
intimidate Arnold Schwartzenegger', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (29, N'Oratory', 4, 3, N'The skill of public speaking. At
+2, you can wing high school speech
contests. At +6, you can be paid to speak
in public. At +lo, you are capable of
delivering a speech to rival Kennedy''s "Ich
Bin Ein Berliner" or Lincoln''s Cettysburg
Address. Rockers with an Oratory Skill of
+6 or better can add +1 when using their
Charismatic 1 eaders hip ability. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (30, N'ResistTorture/Drugs', 4, 3, N'Characters with this
skill are especially toughened against in7
terrogation, torture and mind control
drugs. A successful use of this skill will
automatically increase the difficulty of any
interrogation attempt made by another
party by one level.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (31, N'Streetwise', 4, 3, N'The knowledgeof the "seamy"
side of life-where to get illegal and contraband things, how to talk to the criminal
element, and avoiding bad situations in
bad neighborhoods. With a Streetwise of
+2 or better, you can get "hot" items,
score drugs, etc. A Streetwise of +5 would
allow you to arrange a murder contract,
know a few mobsters who might owe you
favors, and be able to call on muscle when
you need it. At +8 or better, you could
become a major crimelord yourself and
skip the middlemen.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (32, N'Human Perception', 5, 9, N'The skill of detecting
lies, evasions, moods and other emotional
clues from others. At +2, you can usually
tell when you''re not getting the whole
truth. At +6, you can detect subtle evasions and mood swings. At +8, you can
not only detect subtle emotional clues,
but can usually tell what the subject is
hiding in a general way.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (33, N'Interview', 5, 9, N'The skill of eliciting interesting
annecdotes from an interview subject.
This information will be of a more nonspecific and personal nature rather than
specific knowledge (distinguishing this skill
from the skill of Interrogation, where the
user is trying to extract exact information.
Example: Barbara Walters interviews, Mike
Wallace interrogates). At +3 or better, the
subject will usually tell you only information relating to what he/she is well known
for. At +6 or better, the subject will tell you
anecdotes about the past, pontificate
about favorite interests and philosophies,
etc. At +9 or better, he/she tells you everything-including personal information
about their illegitimate son, the time they
stolea cookieatage4, and thefactthat no
one ever loved them.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (34, N'Leadership', 5, 9, N'The skill of leading and convincing people to follow you. A leader
with a skill of +2 can manage a small office
successfully and be respected for it. A
leader with a skill of +4 or better can lead
a small band of troops into battle and not
get backshot. A leader with a skill of +7 or
better can lead the entire Camelon Empire
into battle and look good doing it. James
Kirk of Star Trek has a Leadership of +11,
but you never will', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (35, N'Seduction', 5, 9, N'The skill of forming and maintaining romantic relationships (this includes your abilities as a lover). This skill
may be used to determine whether or not
players can form relationships with other
non-player characters and the intensity of
these relationships. In certain cases, Referees may want to average this skill with a
player''s Attractiveness to get a more realistic outcome.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (36, N'Social', 5, 9, N'The ability to deal with social situations, like knowing the right forkto useor
when nottotell thejokeaboutthefarmer''s
daughter and the travelling cyberware
salesman. A SocialSkill of +2 or better will
allow you to get by at any fine restaurant
or social function. At +5, you can lunch
with the President with aplomb. No social
situation will faze you, no matter what. At
+8 or above, you can lecture Emily Post on
what''s proper. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (37, N'Persuasion & Fast Talk', 5, 9, N'The ability to talk
others into doing what you want. This
may be used individually or on large
groups. At +3, you can win most debates
or convince your g irlfriend that the blonde
you were with was your sister. At +SI you
are a smooth talker of professional caliber.
Ronald Reagan has a Persuasionof +7. Hitler
had a Persuasion of +9.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (38, N'Perform', 5, 9, N'The skill of trained acting, singing, etc. A trained performer of +4 or
greater can successfully sing for payment
at weddings or small clubs. Performers +6
or greater will be considered to be of
professional caliber, and may have lucrative
contracts and fans. Performers of +9 or
greater are of "star" caliber, have a large
number of fans, and may be recognized
on the street.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (39, N'Accounting', 6, 1, N'The ability to balance books
(or create false books), juggle numbers,
create budgets and handle day to day
business operations.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (40, N'Anthropology', 6, 1, N'The knowledge of human
cultures, habits and customs. Unlike
Streetwise (which covers only the cultures
and customs of the Street), or Social(which
covers only what you should do in a given
situation), Anthropology covers general
customs and background of a culture. For
example, with Streetwise, you know what
alleys to avoid and what gangs are dangerous. With Social, you knowthe properforms
of address for a high ranking Japanese
zaibatsu head. With Anthropology, you know
that the customs of a N''Tanga tribesman
requirethat a young man kill a lion in order
to be accepted as an adult male. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (41, N'Awareness/Notice', 6, 1, N'This is the equivalent
of a "trained observer" skill, allowing characters to notice or be aware of clues,
shadowers and other events. With an
Awareness of +2 you will usually spot small
pieces of paper with notes on them, doors
left ajar, and obvious expressions of lying
or dislike. An Awarenessof +5 or better allows
you to spot fairly well hidden clues, notice
small changes in expression, and fairly
sophisticated attempts to "shadow" you.
With an Awareness of +8 or greater, you
routinely perform the sorts of deductive
reasoning seen in the averageTVcop show
("The murderer was left handed because
this knife has a specialized handle").
Sherlock Holmes has a +10 Awareness.
Players without this skill may only use their
Intelligence Stat.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (42, N'Biology', 6, 1, N'General knowledge of animals,
plants, and other biological systems. At
level +3, you know most types of common
animals, plants. At +6, you have a general
understanding of genetics, cellular biology, etc. At +lo, you can perform most
bio-lab procedures, including gene mapping and splicing', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (43, N'Botany', 6, 1, N'The general knowledge of plants
and plant identification. At level +3, you
know most common plants and can identify which ones are dangerous and why. At
a +6, you can identify most important
plantsfound worldwideand havea working
knowledge of their uses. At +8, you have
the equivalent of a doctorate in Botany and
know all about rare poisons, exotic orchids
and other useful plants. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (44, N'Chemistry', 6, 1, N'The required skill for mixing
chemicals and creating various compounds.
A level +2 Chemistvis equal to high school
chemistry. A level +4 is equal to a trained
pharmacist or college level chemist. A +8
is a trained laboratory chemist.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (45, N'Composition', 6, 1, N'The required skill for writing
songs, articles, or stories. A Composing Skill
of +4 or greater gives your character the
abilityto producesalable work. A Skill of +8
or more produces work of such a high caliber
that the creator may have a strong literary
following and not a little critical acclaim. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (46, N'Diagnose Illness', 6, 1, N'The skill of clinically diagnosing symptoms and medical problems. A +3 is
the equivalent of a high school nurse-you can
recognize most common injuries and complaints. At +6, you would be equivalent to a
trained intern; you can recognize many uncommon illnesses and know how to treat most
common ones. A +9 is the equivalent of a skilled
diagnostician; other physicians come to you to
get a diagnosis. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (47, N'Education 8 General Knowledge', 6, 1, N'This skill is
the equivalent of a basic public school education, allowing you to know how to read, write,
use basic math, and know enough history to get
by. In effect, it is a "lore" or trivia skill. A level of
+1 isa basicgradeschool education.Askil1 of+2
is equal to a high school equivalency. A
Knowledge Skill of +3 is equal to a college
education, +4 or higher is equal to a Masters or
Doctorate. At +7, you are an extremely welleducated person, and are asked to play Trivial
Pursuit a lot. At +9 and above, you are one of
those people who knows a lot about everything
(and hopefully has the good sense to keep his
mouth shut). ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (48, N'Expert', 6, 1, N'You may use this skill to be an expert on
onespecificsubject, such as rare postage stamps,
obscure weapons, a foreign language, etc. At
+3, you are the local expert. At +6, you know
enough to publish a few books on the subject.
At +8 or better, your books are recognized as
major texts on the subject, and you could do the
talk-show circuit if you wanted to. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (49, N'Gamb1e', 6, 1, N'Thes kill of knowing howtomake bets,
figure odds, and play games of chance successfully. As any professional gambler knows, this is
notaluckskill. At+2,youarethelocalcardshark
at the Saturday night poker game. At +6, you
can make a living at the tables in Vegas and
Monte Carlo. At +9 or better, you can take on
James Bond at roulette and stand a good chance
of breaking the bank. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (50, N'Geology', 6, 1, N' A functional knowledge of rocks, minerals and geologic structures. At +3, you can
identify most common rocks and minerals. At
+6, you have the equivalent of a college degree
in Geology and can identify minerals and geological structures with ease. At +8, you can
teach geology in high school.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (51, N'Hide/Evade', 6, 1, N'The skill of losing pursuers, covering tracks and otherwise evading people on
your trail. At +3, you can lose most boostergangers on the rampage. At +6, you can ditch
cops and private eyes. At +8, you can ditch
most Solos. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (52, N'History', 6, 1, N'The knowledge of facts and figures of
past events. In game play, this might be used to
determine if a character is familiar with a particular clue related to a past event. At +2, you
have the equivalent of a grade school history
education. At +6, you would have the equivalent of a college grasp on the subject. At +8,
you could teach history in high school. At +9,
you may have written a few of the most oftused texts on a particular historical personage
or epoch. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (53, N'Know Language', 6, 1, N'The knowledge of a foreign
tongue. At +2, you can "get by" with speaking
the language. At +3, you can actually read a
written form of it. At +6 and above, you are
fairly fluent, although no native will be fooled
byyourability. At +8 and above, you speak and
read the lanquage like a native.
Each language known requires a separate Know
Lanquage Skill, however, one may use the
knowledge of a particular Language with up to
1/2 (round down) proficiency with any language in the same linguistic family (example:
knowing Cantonese at +4 will give you the
ability to understand and speak Mandarin at
+2).', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (54, N'Library Search', 6, 1, N'The skill of using databases,
DataTermP, libraries and other compiled information sources to find facts. With a skill of +2
you can use most simple databases. With a skill
of +6, you can easily access the Library Congress. At +9, you can comprehend almost any
public database and find very obscure facts.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (55, N'Mathematics', 6, 1, N'The skill of understanding calculations and mathematical formulas. At +3,
you have the ability to add, subtract, divide and
multiply. At +4, you can do algebra and geometry. At +6, you can perform calculus. At +9
you can deduce your own mathematical formulas. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (56, N'Physics', 6, 1, N'The ability to calculate physical principles, such as gas pressures, mechanical energies, etc. This skill requires a basic Mathematics
Skill of +4.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (57, N'Programming', 6, 1, N'The required skill to write programs and to re-program computer systems.
This skill does not allow players to actually do
repairson a computer(this requires Electronics).
With a Programming Skill of +1, you can do
simple EBASIC programs. A Programming Skill
of +3 or better allows you to know some higher
level languages and be able to write reasonably complex programs (including
video games). Players with a Programming
Skill +6 or better are considered to be
professionals, who can build operating
software, design mainframe systems, and
hold down a steady job at your average
Silicon Valley firm. With a frogramming
Skill of +9 or better, other programmers
speak your name with reverence ("You
invented Q? Wow!"), young hackers set
out to crack your systems, and any
computer software you design instantly
gets used by every business application in
the world. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (58, N'Shadow/Track', 6, 1, N'The skill of shadowing
and following people. Thisskill is primarily
used in urban or inhabited areas rather
than in wilderness (where the skill of Survival incorporates tracking game in the
wilds). ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (59, N'Stock Market', 6, 1, N'The ability to play the
stock market, engage in routine stock
transactions and manipulate stocks profitably. At +2, you know enough to invest
in junk bonds and lose your shirt. At +6,
your investments pay off 75% of the time.
At +9, you are a major heavy on the
Market, routinely dabble in international
stocks, and can write learned articles on
the subject of investment. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (60, N'System Knowledge', 6, 1, N' Basic knowledge of
the geography of the Net, its lore and
history, as well as knowledge of the important computer systems, their strengths
and their weaknesses. At +2, you can
generally navigate around the Net and
know where all the local places are. At +6,
you know the locations of most places in
the Net, and have a working
understanding of its largest and most well
known systems. At +9, you know the
entire Net like the back of your hand,
know the general layouts of the important
systems cold, and are aware of the layouts
for the rest of them. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (61, N'Teaching', 6, 1, N'The skill of imparting knowledge to someone else (if you don''t think
this isa skill, you ought to try it sometime).
Players may not teach any skill unless they
have a higher skill level than the student.
The referee is the final arbiter of how long
it takes to teach a skill. At a Teaching Skill
of +3 or better, you can professionally
teach students up to High School. At +6,
you know enough to be a college professor (if you wanted ). At +9 or greater, you
are recognized by others in the field as
good enough to guest lecture at MIT or
Cal Tech; your texts on the subject are
quoted as the major references, and you
might have a TV showon the equivalent of
the PBS channel.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (62, N'Wilderness Survival', 6, 1, N'The required skill for
knowing how to survive in the wilds.
Knowledge includes how to set traps,
forage for wood, trackgame, build shelters,
make fires. The average Boy Scout has a
Survival of +3. A Special Forces Green
Beret has a Survivalof +6 or above. Grizzly
Adams, Mountain Man of the Wilderness,
would have a +9 or +10 Survival Skill.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (63, N'Zoology', 6, 1, N'Knowledge of lifeforms, biological processes and their relation to the
environment. At +2, you know most common animals. At +5, you know not only
well known animals, but also about many
exotics and endangered species. At +8,
you are knowledgable on almost all animals, knowtheirhabitswel1,and havea+l
advantage to any Wilderness Survival Skills
(you know where to find the game).', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (64, N'Archery', 7, 2, N' The skill required to use bows,
crossbows and other arrow-based ranged
weapons. See Handgun for details.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (65, N'Athletics', 7, 2, N'This skill is required for accurate
throwing, climbing, and balancing. It
combines the basic elements of any high
school level sports program. At +3 and
above, you are the equivalent of a real
high school "jock". At +5 and above, you
can perform in college level competitions.
At +8 and above, you are of Olympic or
Professional caliber.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (66, N'Brawling', 7, 2, N'The skill of fighting man to man
with fist, feet and other parts of the body.
Brawling is not a trained skill- it is learned
on the Street by getting into a lot of fights.
Unlike Martial Arts, there are no specialized
attacks and no damage bonuses based on
level of mastery. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (67, N'Dance', 7, 2, N'The specific skill needed to become
a professional dancer. A trained dancer +4
or greater can successfully dance for payment in small clubs or dance troupes.
Dancers +6 or greater will be considered to
be of professional caliber, and regularly
give performances and have fans. Dancers
+9 or greater are of "star" caliber, have a
large number of fans, and may be recognized on the street. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (68, N'Dodge & Escape', 7, 2, N'This skill is required to
dodge attacks and escape grapples and
holds. If an attack is made without your
knowledge, you may not apply this skill to
your Defense roll. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (69, N'Driving', 7, 2, N'This skill allows you to pilot all
ground vehicles like cars, trucks, tanks and
hovercraft. This skill is not useable for piloting aircraft. A skill of +3 is equal to that of a
very good non-professional driver. A skill of
+6 allows you to drive with the skill of a
moderately skilled race driver. An driver
with a skill of +8 or greater will be nationally
known as a racer, regularly win championship races, and possibly have access to the
most advanced ground vehicles available
(as long as he makes an endorsement). ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (70, N'Fencing', 7, 2, N'The mastery of swords, rapiers
and monoblades. AFencing Skill of +3 allows
you to be competent with a blade. A Skill of
+5 makes you fairly skilled. A Fencing Skill of
+6 might win you the National Fencing
Competitions. A Skill of +8 will get you a
reputation for being a true swordsman of
duellist caliber. People like D''Artagnan or
Miyamoto Musashi have Skills of +10. They
are legendary masters of the blade; the
mention of whom will cause all but the
stupidest young bravo to run for cover. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (71, N'Handgun', 7, 2, N'You must have this skill to effectively use handguns of any type, including
cyberwear types. At +2, you can use a
handgun effectively on a target range,
though combat will still rattle you. At +5,
you are as skilled as most military officers or
policemen. At +7, you can do the sort of
fancy shooting you see on TV, and have
begun to get a reputation of being "good
with a gun". At +8, you are a recognized
gunslinger with a “rep”. The very sound
of your name makes some people back
down in fear. At +lo, you are a legendary
gunslinger, feared by all except the stupid
young punks who keep trying to “take”
you in innumerable gunfight challenges. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (72, N'Heavy Weapons', 7, 2, N'The required skill for
using grenade launchers, autocannon,
mortars, heavy machine guns, missiles
and rocket launchers. ALevel+S skill would
be equivalent to a general military “Heavy
Weapons” training course, giving the user
theabilitytouseanyoralloftheseweapon
types. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (73, N'Martial Arts', 7, 2, N'This skill covers any type of
trained fighting style using hands, feet, or
specialized “martial arts” weapons. You
must elect a style of martial art and take a
separate skill for each style (for example,
you would have to take Karate and judo
separately, spending points for each one.
Difficulty modifiers are listed in ( ) next to
each skill listed below. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (74, N'Melee', 7, 2, N'The ability to use knives, axes,
clubs and other hand to hand weapons in
combat. Note: when using non-ranged
cyberweapons such as rippers, scratchers,
slice n‘dices, cyberbeasts, and battlegloves,
you must use this skill.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (75, N'Motorcycle', 7, 2, N'The required skill to operate
motorcycles, cyberbikes and other two
and three-wheeled vehicles.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (76, N'Operate Heavy Machinery', 7, 2, N'The required
skill to operate tractors, tanks, very large
trucks and construction equipment. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (77, N'Piloting', 7, 2, N'In general, this is the skill of
controlling aircraft. Aircraft are broken
into categories: Gyro und Rororcrufr,
Fixed Wing Aircraft, Dirigibles and
Vectored Thwsr Aerodynes (A V-s). A
Piloting Skill of +1 allows you to take off
and landsafelyin good weatherconditions.
A Piloting Skill of +3 or more makes you a
trained pilot, able to engage in most
combat situations or bad weather. Pilots
with a Skill of +6 or greater are veteran
pilots, able to handle themselves in almost
any situation, including aerobatic manuevers. Pilots with a Skill of +9 or greater are so
good, they have a rep as pilots, and are widely
known among the piloting fraternityfor having
the "right stuff".', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (78, N'Pilot Gyro (3)', 7, 2, N'The ability to pilot all types of
rotorwing aircraft, including gyros, copters and
Ospreys.', 3, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (79, N'Pilot Fixed Wing(2)', 7, 2, N'The ability to pilot fixed
wing jets and light aircraft. Ospreys may be
flown with this skill, but only in the straight
ahead (non-hover) mode.', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (80, N'Pilot Dirigible (2)', 7, 2, N'The ability to pilot all lighter
than air vehicles, including cargo dirigibles,
blimps and powered balloons. ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (81, N'Pilot Vectored Thrust Vehicle (3)', 7, 2, N'The skill of
piloting all types of vectored thrust vehicles,
including hovercars, hover rafts
and AV-4, 6 and 7 vehicles', 3, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (82, N'Rifle', 7, 2, N'You must have this skill
to use rifles/shotguns
effectively (see Handguns for
limitations and modifiers).', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (83, N'Stealth (2)', 7, 2, N'The skill of hiding
in shadows, moving silently,
evading guards, etc. A Stealth
Skill of +1 is about the level of
averysneakyl Oyearoldstealing cookies. At +3, you are
able to get past most guards,
or your parents if you''ve been
grounded. At +6, you are
good enough toslip smoothly
from shadow to shadow and
not make any noise. At +8,
youaretheequalof most Ninja
warriors. At +10, you move as silently as a shadow making the Ninja sound like elephants', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (84, N'Submachinegun', 7, 2, N'You must have this skill to
use any type Of submachine gun effectively
(see Handguns for limitations and modifiers).', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (85, N'Aero Tech (2)', 8, 4, N'The required skill for repairing
fixed wing aircraft, including Ospreys, jets, and
light aircraft. With a Skill of +3, you can perform
most routine maintenance tasks. With a Skill of
+6, you can do engine teardowns and major
structural repairs. With a Skill of +9 or better,
you are capable of designing and building your
own aircraft. ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (86, N'AV Tech (3)', 8, 4, N'The required skill for repairing all
ducted fan aerodyne vehicles. At +3, you can
perform routine maintenance. At +6, you can tear down engines and modify an AV. Ai +lV,
you can design your own AVs on common
airframes. ', 3, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (87, N'Basic Tech (2)', 8, 4, N'The required skills for building
or repairing simple mechanical and electrical
devices, such as car engines, television sets, etc.
With a Basic Tech Skill of +3 or better, you can fix
minor car problems, repair basic wiring, etc. A
Basic Tech Skill of +6 or better can repair stereos
and TVs, rebuild an engine, etc. A Basic Tech
Skill of +9 or better can build a simple computer
from scratch, put together a race car engine,
and maintain any kind of industrial machinery.
However, they do not know enough specialized
knowledge to apply it to complex thingssuch as
aircraft(just like Mr. Goodwrench doesn''t know
how to build and service an F-16). ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (88, N'Cryotank Operation', 8, 4, N'The required skill for operating,
repairing and maintaining life
suspension and body chilling
devices. A minimum skill of +4
is required to chill down a
healthy person. A minumum
skill of +6 for chilling a
wounded person. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (89, N'Cyberdeck Design (2)', 8, 4, N'The
required skill for designing
cyberdecks. At level +4, you
can modify an existing cyberdeck for greater speed or
memory. At level +6, you can
design a deck equal to most
existing designs. At +8, you
can design decks that are
substantially improved over
existing designs. ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (90, N'CyberTech (2)', 8, 4, N'The required skill for repairing
and maintaining cyberwear. At level +2, you
can keep your cyberwear tuned up and can
replace its power batteries. At level +6, you can
strip down most cybeMear and even make
simple modifications. At level +8, you can
design your own cyberwear to order.', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (91, N'Demolitions(2)', 8, 4, N'This skill allows the character
to be knowledgeable in the use of explosives, as
well as knowing the best explosives to use for
which jobs, how to set timers and detonators,
and how much explosive to use to accomplish
a desired result. ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (92, N'Disguise', 8, 4, N'The skill of disguising your character
to resemble someone else, whether real or
fictitious. This skill incorporates elements of
both makeup and acting, although it is not the
same as the ability to actually be an actor.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (93, N'Electronics', 8, 4, N'The required skill for maintaining,
repairing and modifying electronic instruments
such as computers, personal electronics hardwa~ electronic security systems, cameras and
monitors. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (94, N'Electronic Security (2)', 8, 4, N'The skill of installing or
countering electronic eyes, electronic locks,
bugs and tracers, security cameras, pressure
plates, etc. At level +3, you can jimmy or install
most apartment locks and security cams. At +6,
you can override most corporate office locks
and traps. At +9, you can enter most high
security areas with impunity. ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (95, N'First Aid', 8, 4, N'This skill allows the user to bind
wounds, stop bleeding, and revive a stunned
patient (see Trauma Team, pg. 11 6 for details).', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (96, N'Forgery', 8, 4, N'The skill of copying and creating false
documents and identifications. This skill may
also be applied to the detection of same; if you
can fake it, you can usually tell a fake as well.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (97, N'Gyro Tech (3)', 8, 4, N'The skill of repairing and maintaining rotorwing aircraft such as helicopters
and gyrocopters.', 3, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (98, N'Paint or Draw', 8, 4, N'The skill of producing professional drawings. A Skill of +3 allows you to
produce salable “modern” art. A Skill of +6 will
produce artwork that is recognizable and extremely pleasant to the eye-as well as salable.
An artist with a Skill of +8 or greater will be
nationally known, haveexhibits in galleries, and
have other lesser artists studying his style in art
school. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (99, N'Photography 8 Film', 8, 4, N'The skill of producing
professional-caliber photographs or motion
pictures. ASkill of +2 allows you tomakedecent
home movies. A Skill of +4 or better creates
work capable of winning amateur contests. A
Skill of +6 or better will produce work of the
level of the average Playboy cover or rock video.
A photographer or cinematographer with a
Skill of +8 or betterwill be nationally known and
probably famous. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (100, N'Pharmaceuticals (2)', 8, 4, N'The skill of designing and
manufacturing drugs and medicines. A minimum Chemistry skill of +4 is required. At +4,
you can make asprin. At +6, you can make
hallucinogenics or antibiotics. At level +9 you
can build designer drugs tailored to individual
body chemistries. ', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (101, N'Pick Lock', 8, 4, N'The skill required to pick locks and
break into sealed containers and rooms. At +3,
you can jimmy most simple locks. At +6you can
crack most safes. At +9 or better, you have a rep
as a master cracksman, and are known to all the
major players in the Cyberpunk world.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (102, N'Pick Pocket', 8, 4, N'The required skill for picking pockets without being noticed, as well as ”shoplifting” small items. For ideas on levels of ability,
see Pick lock, above. ', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (103, N'Play Instrument', 8, 4, N'The skill of knowing how to
play a musical instrument. You must take this
skill separately for each type of instrument
played. A Skill of +4 or higher will qualify your
character to play professional “gigs”. A Skill of
+8 and above will gain the musician some
professional acclaim, possibly with recording
contracts and command performances. At +10,
you are widely acclaimed, have lots of Crammys, and regularly jam with Kerry Eurodyne.', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (104, N'Weaponsmith (2)', 8, 4, N'The required skill for repairing and maintaining weapons of all types. At
level +2, you can do repairs and field stripping.
At level +6, you can repair all types of weapons
and make simple modifications. At level +8,
you can design your own weapons to order.', 2, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (105, N'Corporate Policy', 6, 1, N'Corporate Policy', 1, 0)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (106, N'Custom ATTR', 2, 8, N'Skill Holder for ATTR', 1, 1)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (107, N'Custom BODY', 3, 6, N'Skill Holder for BODY', 1, 1)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (108, N'Custom COOL/WILL', 4, 3, N'Skill Holder for COOL/WILL', 1, 1)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (109, N'Custom EMPATHY', 5, 9, N'Skill Holder for EMPATHY', 1, 1)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (110, N'Custom INT', 6, 1, N'Skill Holder for INT', 1, 1)
GO
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (111, N'Custom REF', 7, 2, N'Skill Holder for REF', 1, 1)
INSERT [dbo].[Skill] ([id], [Name], [SkillType], [StatID], [Description], [Multiplier], [IsCustom]) VALUES (112, N'Custom TECH', 8, 4, N'Skill Holder for TECH', 1, 1)
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
SET IDENTITY_INSERT [dbo].[SkillTypes] ON 

INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (1, N'Special Ability')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (2, N'ATTR')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (3, N'BODY')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (4, N'COOL/WILL')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (5, N'EMPATHY')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (6, N'INT')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (7, N'REF')
INSERT [dbo].[SkillTypes] ([id], [Name]) VALUES (8, N'TECH')
SET IDENTITY_INSERT [dbo].[SkillTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Stat] ON 

INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (1, N'Intelligence (INT)', N'This is a measure of your problem solving
ability; figuring out problems, noticing
things, remembering information. Almost
every character type will need a high Intel-
ligence, with Netrunners and Corporates 
requiring the highest of all. ', N'INT')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (2, N'Reflexes (REF):', N'This is a combined index, covering not
only your basic dexterity, but also how
your level of physical coordination will
affect feats of driving, piloting, fighting
and athletics. Characters who intend to 
engage in a great deal of combat (such as 
Solos, Nomads or Rockerboys) should 
always invest in the highest possible Reflex', N'REF')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (3, N'Cool (CL)', N'This index measures how well the character stands up to stress, 
pressure, physical pain and/or torture. 
In determining your willingness to fight on despite wounds or your fighting ability under fire, Cool (CL) is essential. 
It is also the measure of how "together" your character is and how tough he appears to others. 
Rockerboys and Fixers should always have a high Cool with Solos and Nomads having the highest of all.', N'CL')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (4, N'Technical Ability (TECH)', N'This is an index of how well you relate to hardware and other technically oriented things. 
In Cyberpunk, the ability to use and repair technology is of paramount impotence - 
TECH will be the Stat used when fxing, repairing and attempting to use unfamiliar tech. 
While all character should have a descent Tech Stat, 
potential Techies should always opt for the highest possible score in this area.', N'TECH')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (5, N'Luck (LK)', N'This is the intangible "something" that throws the balance of events into your favor. 
Your luck represents how many points you may use each game to influence the outcome of critical event.
To use Luck, you may add any or all the points of luck a character has to a critical die roll 
(declaring your inetntion to use Luck before the roll is made) until all of your Luck stat is used up. 
Luck is always restored at the end of each game session.', N'LK')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (6, N'Body Type (BT)', N'Strength, Endurance and Constitution are all based on the character''s Body Type. 
Body Type determines how much damage you can take in wounds, how much you can lift or carry. 
How far you can throw, how well you recover from shock, and how much additional damage you cause with physical attacks. 
Body Type is important to all character types, but to Solos, Rockerboys and Nomads most of all.', N'BT')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (7, N'Movement Allowance (MA)', N'This is index of how fast character can run (impotent in combat situations). 
The higher your Movement Allowance (MA), the more distance you can cover in turn.', N'MA')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (8, N'Attractiveness (ATT)', N'This is how good-looking you are. In Cyberpunk, it''s not enough to be good - you have to look good while you''re doing it (Attitude vs Everything). 
Attractiveness is especially impotent to Medias and Rockerboys, as being good-looking is part of their jobs.', N'ATT')
INSERT [dbo].[Stat] ([id], [Name], [Description], [ABBR]) VALUES (9, N'Empathy', N'This Stat represent how well you relate to other living things - a measure of charisma and sympathetic emotions. 
In a world of alienated, future-shocked survivors, the ability to be "human" can no longer be taken for granted. 
Empathy (EM) is critical when leading, convincing, seducing or perceiving emotional undercurrents. 
Empathy is also a measure of how close he/she is to the line between feeling human being and cold blooded cyber-monster.', N'EMP')
SET IDENTITY_INSERT [dbo].[Stat] OFF
GO
SET IDENTITY_INSERT [dbo].[Subgrid] ON 

INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (1, 20, 20, N'New Subgrid', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (2, 20, 20, N'Test Subgrid', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (3, 20, 20, N'blank', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (4, 20, 20, N'foo', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (6, 20, 20, N'bar', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (7, 20, 20, N'baz', N'de277540-2189-43b0-977c-e42adee4a7a4')
INSERT [dbo].[Subgrid] ([id], [width], [height], [Name], [UserID]) VALUES (8, 20, 20, N'Info Broker', N'de277540-2189-43b0-977c-e42adee4a7a4')
SET IDENTITY_INSERT [dbo].[Subgrid] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([id], [name]) VALUES (1, N'Sq. Foot')
INSERT [dbo].[Units] ([id], [name]) VALUES (2, N'Ea.')
INSERT [dbo].[Units] ([id], [name]) VALUES (3, N'Hr.')
INSERT [dbo].[Units] ([id], [name]) VALUES (4, N'Meter')
INSERT [dbo].[Units] ([id], [name]) VALUES (5, N'%')
INSERT [dbo].[Units] ([id], [name]) VALUES (6, N'Slot')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[WeaponConcTypes] ON 

INSERT [dbo].[WeaponConcTypes] ([id], [Name], [Description]) VALUES (1, N'Jacket', N'Jacket')
INSERT [dbo].[WeaponConcTypes] ([id], [Name], [Description]) VALUES (2, N'NA', N'N/A')
SET IDENTITY_INSERT [dbo].[WeaponConcTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Weapons] ON 

INSERT [dbo].[Weapons] ([id], [Name], [NumDice], [DiceType], [Bonus], [ROF], [REL], [Type], [Conc], [Shots1], [Shots2], [Range], [Description]) VALUES (1, N'Mustang Arms MkII', 3, 6, 0, 3, 1, 1, 1, 12, 20, 50, N'Mustang Arms Mark 2.')
INSERT [dbo].[Weapons] ([id], [Name], [NumDice], [DiceType], [Bonus], [ROF], [REL], [Type], [Conc], [Shots1], [Shots2], [Range], [Description]) VALUES (2, N'Monoblade', 2, 6, 1, 1, 1, 2, 2, 0, 0, 0, N'Monoblade')
SET IDENTITY_INSERT [dbo].[Weapons] OFF
GO
SET IDENTITY_INSERT [dbo].[WeaponTypes] ON 

INSERT [dbo].[WeaponTypes] ([id], [Name], [Description]) VALUES (1, N'Pistol', N'Pistol')
INSERT [dbo].[WeaponTypes] ([id], [Name], [Description]) VALUES (2, N'Blade', N'Sword, knife, etc')
SET IDENTITY_INSERT [dbo].[WeaponTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/11/2024 5:28:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((1)) FOR [Memory]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((0)) FOR [Speed]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((1)) FOR [Int]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((1)) FOR [NumCPU]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((1)) FOR [IsPortable]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((0)) FOR [IsCyberAvailable]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((1.0)) FOR [BateryHours]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((2)) FOR [WallStrength]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((0.0)) FOR [PriceLow]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((0.0)) FOR [PriceHigh]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((3)) FOR [NumSlots]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((0)) FOR [Chipslots]
GO
ALTER TABLE [dbo].[ComputerImprovements] ADD  CONSTRAINT [DF__ComputerI__Impro__756D6ECB]  DEFAULT ((0)) FOR [ImprovementAmount]
GO
ALTER TABLE [dbo].[ComputerImprovements] ADD  CONSTRAINT [DF__ComputerI__CostL__76619304]  DEFAULT ((0.0)) FOR [CostLow]
GO
ALTER TABLE [dbo].[ComputerImprovements] ADD  CONSTRAINT [DF__ComputerI__CostH__7755B73D]  DEFAULT ((0.0)) FOR [CostHigh]
GO
ALTER TABLE [dbo].[ComputerImprovements] ADD  CONSTRAINT [DF__ComputerI__CostP__7849DB76]  DEFAULT ((0)) FOR [UnitTypeID]
GO
ALTER TABLE [dbo].[ComputerPeripherals] ADD  CONSTRAINT [DF__ComputerP__CostP__7B264821]  DEFAULT ((0.0)) FOR [CostPerUnitLow]
GO
ALTER TABLE [dbo].[ComputerPeripherals] ADD  CONSTRAINT [DF__ComputerP__CostP__7C1A6C5A]  DEFAULT ((0.0)) FOR [CostPerUnitHigh]
GO
ALTER TABLE [dbo].[ComputerPeripherals] ADD  CONSTRAINT [DF__ComputerP__Units__7D0E9093]  DEFAULT ((0)) FOR [MU]
GO
ALTER TABLE [dbo].[ComputerPeripheralSkillModifiers] ADD  DEFAULT ((0)) FOR [Modifier]
GO
ALTER TABLE [dbo].[ComputerPeripheralStatModifiers] ADD  DEFAULT ((0)) FOR [Modifier]
GO
ALTER TABLE [dbo].[Cyberdeck] ADD  DEFAULT ((1)) FOR [Memory]
GO
ALTER TABLE [dbo].[Cyberdeck] ADD  DEFAULT ((0)) FOR [Speed]
GO
ALTER TABLE [dbo].[Cyberdeck] ADD  DEFAULT ((2)) FOR [WallStrength]
GO
ALTER TABLE [dbo].[Cyberdeck] ADD  DEFAULT ((0.0)) FOR [PriceLow]
GO
ALTER TABLE [dbo].[Cyberdeck] ADD  DEFAULT ((0.0)) FOR [PriceHigh]
GO
ALTER TABLE [dbo].[CyberdeckImprovements] ADD  DEFAULT ((0)) FOR [ImprovementAmount]
GO
ALTER TABLE [dbo].[CyberdeckImprovements] ADD  DEFAULT ((0.0)) FOR [CostLow]
GO
ALTER TABLE [dbo].[CyberdeckImprovements] ADD  DEFAULT ((0.0)) FOR [CostHigh]
GO
ALTER TABLE [dbo].[CyberdeckOptions] ADD  CONSTRAINT [DF__Cyberdeck__CostP__58D1301D]  DEFAULT ((0.0)) FOR [CostPerUinitLow]
GO
ALTER TABLE [dbo].[CyberdeckOptions] ADD  CONSTRAINT [DF__Cyberdeck__CostP__59C55456]  DEFAULT ((0.0)) FOR [CostPerUinitHigh]
GO
ALTER TABLE [dbo].[CyberdeckOptionsSkillModifiers] ADD  DEFAULT ((0)) FOR [Modifier]
GO
ALTER TABLE [dbo].[CyberdeckOptionsStatModifiers] ADD  DEFAULT ((0)) FOR [Modifier]
GO
ALTER TABLE [dbo].[Fortress] ADD  CONSTRAINT [DF_Fortress_isAI]  DEFAULT ((0)) FOR [isAI]
GO
ALTER TABLE [dbo].[FortressCodeGates] ADD  CONSTRAINT [DF__FortressCo__Type__66603565]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[FortressCPU] ADD  CONSTRAINT [DF__FortressCP__Type__5CD6CB2B]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[FortressMemory] ADD  CONSTRAINT [DF__FortressMe__Type__619B8048]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[FortressPrograms] ADD  CONSTRAINT [DF__FortressP__Rezze__7BB05806]  DEFAULT ((1)) FOR [Rezzed]
GO
ALTER TABLE [dbo].[FortressPrograms] ADD  CONSTRAINT [DF_FortressPrograms_Strength]  DEFAULT ((0)) FOR [Strength]
GO
ALTER TABLE [dbo].[FortressPrograms] ADD  CONSTRAINT [DF_FortressPrograms_xPos]  DEFAULT ((0)) FOR [xPos]
GO
ALTER TABLE [dbo].[FortressPrograms] ADD  CONSTRAINT [DF_FortressPrograms_yPos]  DEFAULT ((0)) FOR [yPos]
GO
ALTER TABLE [dbo].[FortressPrograms] ADD  CONSTRAINT [DF_FortressPrograms_Type]  DEFAULT ((5)) FOR [Type]
GO
ALTER TABLE [dbo].[FortressWalls] ADD  CONSTRAINT [DF__FortressWa__Type__5812160E]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_IP]  DEFAULT ((0)) FOR [IP]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_REP]  DEFAULT ((0)) FOR [REP]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_Humanity]  DEFAULT ((0)) FOR [Humanity]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_Dammage]  DEFAULT ((0)) FOR [Dammage]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_xPos]  DEFAULT ((0)) FOR [xPos]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_yPos]  DEFAULT ((0)) FOR [yPos]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_type]  DEFAULT ((6)) FOR [Type]
GO
ALTER TABLE [dbo].[PlayerComputer] ADD  CONSTRAINT [DF_PlayerComputer_isCyberEnabled]  DEFAULT ((0)) FOR [isCyberEnabled]
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] ADD  CONSTRAINT [DF__PlayerCom__Rezze__76EBA2E9]  DEFAULT ((1)) FOR [Rezzed]
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] ADD  CONSTRAINT [DF_PlayerComputerPrograms_Strength]  DEFAULT ((0)) FOR [Strength]
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] ADD  CONSTRAINT [DF_PlayerComputerPrograms_Packed]  DEFAULT ((0)) FOR [Packed]
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] ADD  CONSTRAINT [DF_PlayerComputerPrograms_Type]  DEFAULT ((5)) FOR [Type]
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] ADD  CONSTRAINT [DF__PlayerCyb__Rezze__7226EDCC]  DEFAULT ((1)) FOR [Rezzed]
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] ADD  CONSTRAINT [DF_PlayerCyberdeckPrograms_Strength]  DEFAULT ((0)) FOR [Strength]
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] ADD  CONSTRAINT [DF_PlayerCyberdeckPrograms_Packed]  DEFAULT ((0)) FOR [Packed]
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] ADD  CONSTRAINT [DF_PlayerCyberdeckPrograms_Type]  DEFAULT ((5)) FOR [Type]
GO
ALTER TABLE [dbo].[PlayerPrograms] ADD  CONSTRAINT [DF__PlayerPro__Rezze__00750D23]  DEFAULT ((1)) FOR [Rezzed]
GO
ALTER TABLE [dbo].[PlayerSkill] ADD  CONSTRAINT [DF_PlayerSkill_Ranks]  DEFAULT ((0)) FOR [Ranks]
GO
ALTER TABLE [dbo].[PlayerSkill] ADD  CONSTRAINT [DF_PlayerSkill_Bonus]  DEFAULT ((0)) FOR [Bonus]
GO
ALTER TABLE [dbo].[PlayerSkill] ADD  CONSTRAINT [DF_PlayerSkill_CurrentIP]  DEFAULT ((0)) FOR [CurrentIP]
GO
ALTER TABLE [dbo].[PlayerSkill] ADD  CONSTRAINT [DF_PlayerSkill_IsCustom]  DEFAULT ((0)) FOR [IsCustom]
GO
ALTER TABLE [dbo].[PlayerSkill] ADD  CONSTRAINT [DF_PlayerSkill_IsChipped]  DEFAULT ((0)) FOR [IsChipped]
GO
ALTER TABLE [dbo].[PlayerSkillModifiers] ADD  DEFAULT ((0.0)) FOR [amount]
GO
ALTER TABLE [dbo].[PlayerStatModifiers] ADD  DEFAULT ((0.0)) FOR [amount]
GO
ALTER TABLE [dbo].[Program] ADD  DEFAULT ((1)) FOR [Strength]
GO
ALTER TABLE [dbo].[Program] ADD  DEFAULT ((0.0)) FOR [cost]
GO
ALTER TABLE [dbo].[Program] ADD  DEFAULT ((0)) FOR [MU]
GO
ALTER TABLE [dbo].[Program] ADD  CONSTRAINT [DF_Program_isCustom]  DEFAULT ((0)) FOR [isCustom]
GO
ALTER TABLE [dbo].[Skill] ADD  CONSTRAINT [DF_Skill_Multiplier]  DEFAULT ((1)) FOR [Multiplier]
GO
ALTER TABLE [dbo].[Skill] ADD  CONSTRAINT [DF_Skill_IsCustom]  DEFAULT ((0)) FOR [IsCustom]
GO
ALTER TABLE [dbo].[Subgrid] ADD  CONSTRAINT [DF_Subgrid_Name]  DEFAULT ('New Subgrid') FOR [Name]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ComputerImprovements]  WITH CHECK ADD  CONSTRAINT [FK_ComputerImprovements_Units] FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[Units] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComputerImprovements] CHECK CONSTRAINT [FK_ComputerImprovements_Units]
GO
ALTER TABLE [dbo].[ComputerPeripherals]  WITH CHECK ADD  CONSTRAINT [FK__ComputerP__UnitT__7E02B4CC] FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[Units] ([id])
GO
ALTER TABLE [dbo].[ComputerPeripherals] CHECK CONSTRAINT [FK__ComputerP__UnitT__7E02B4CC]
GO
ALTER TABLE [dbo].[ComputerPeripheralSkillModifiers]  WITH CHECK ADD  CONSTRAINT [FK__ComputerP__Compu__02C769E9] FOREIGN KEY([ComputerPeripheralID])
REFERENCES [dbo].[ComputerPeripherals] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComputerPeripheralSkillModifiers] CHECK CONSTRAINT [FK__ComputerP__Compu__02C769E9]
GO
ALTER TABLE [dbo].[ComputerPeripheralSkillModifiers]  WITH CHECK ADD FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComputerPeripheralStatModifiers]  WITH CHECK ADD  CONSTRAINT [FK__ComputerP__Compu__078C1F06] FOREIGN KEY([ComputerPeripheralID])
REFERENCES [dbo].[ComputerPeripherals] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComputerPeripheralStatModifiers] CHECK CONSTRAINT [FK__ComputerP__Compu__078C1F06]
GO
ALTER TABLE [dbo].[ComputerPeripheralStatModifiers]  WITH CHECK ADD FOREIGN KEY([StatID])
REFERENCES [dbo].[Stat] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CyberdeckOptions]  WITH CHECK ADD  CONSTRAINT [FK__Cyberdeck__UnitT__5BAD9CC8] FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[Units] ([id])
GO
ALTER TABLE [dbo].[CyberdeckOptions] CHECK CONSTRAINT [FK__Cyberdeck__UnitT__5BAD9CC8]
GO
ALTER TABLE [dbo].[CyberdeckOptionsSkillModifiers]  WITH CHECK ADD  CONSTRAINT [FK__Cyberdeck__Cyber__607251E5] FOREIGN KEY([CyberdeckOptionID])
REFERENCES [dbo].[CyberdeckOptions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CyberdeckOptionsSkillModifiers] CHECK CONSTRAINT [FK__Cyberdeck__Cyber__607251E5]
GO
ALTER TABLE [dbo].[CyberdeckOptionsSkillModifiers]  WITH CHECK ADD FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CyberdeckOptionsStatModifiers]  WITH CHECK ADD  CONSTRAINT [FK__Cyberdeck__Cyber__65370702] FOREIGN KEY([CyberdeckOptionID])
REFERENCES [dbo].[CyberdeckOptions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CyberdeckOptionsStatModifiers] CHECK CONSTRAINT [FK__Cyberdeck__Cyber__65370702]
GO
ALTER TABLE [dbo].[CyberdeckOptionsStatModifiers]  WITH CHECK ADD FOREIGN KEY([StatID])
REFERENCES [dbo].[Stat] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cybernetics]  WITH CHECK ADD FOREIGN KEY([SurgType])
REFERENCES [dbo].[SurgicalCode] ([id])
GO
ALTER TABLE [dbo].[Cybernetics]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[CyberneticTypes] ([id])
GO
ALTER TABLE [dbo].[Fortress]  WITH CHECK ADD  CONSTRAINT [FK__Fortress__subgri__5535A963] FOREIGN KEY([subgridID])
REFERENCES [dbo].[Subgrid] ([id])
GO
ALTER TABLE [dbo].[Fortress] CHECK CONSTRAINT [FK__Fortress__subgri__5535A963]
GO
ALTER TABLE [dbo].[Fortress]  WITH CHECK ADD  CONSTRAINT [FK_Fortress_AI_ICON] FOREIGN KEY([AI_ICON_ID])
REFERENCES [dbo].[AI_ICON] ([id])
GO
ALTER TABLE [dbo].[Fortress] CHECK CONSTRAINT [FK_Fortress_AI_ICON]
GO
ALTER TABLE [dbo].[Fortress]  WITH CHECK ADD  CONSTRAINT [FK_Fortress_Fortress] FOREIGN KEY([AI_Personality_ID])
REFERENCES [dbo].[AI_Personality] ([id])
GO
ALTER TABLE [dbo].[Fortress] CHECK CONSTRAINT [FK_Fortress_Fortress]
GO
ALTER TABLE [dbo].[FortressCodeGates]  WITH CHECK ADD  CONSTRAINT [FK__FortressC__Fortr__6754599E] FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
GO
ALTER TABLE [dbo].[FortressCodeGates] CHECK CONSTRAINT [FK__FortressC__Fortr__6754599E]
GO
ALTER TABLE [dbo].[FortressCodeGates]  WITH CHECK ADD  CONSTRAINT [FK__FortressCo__Type__68487DD7] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[FortressCodeGates] CHECK CONSTRAINT [FK__FortressCo__Type__68487DD7]
GO
ALTER TABLE [dbo].[FortressCPU]  WITH CHECK ADD  CONSTRAINT [FK__FortressC__Fortr__5DCAEF64] FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
GO
ALTER TABLE [dbo].[FortressCPU] CHECK CONSTRAINT [FK__FortressC__Fortr__5DCAEF64]
GO
ALTER TABLE [dbo].[FortressCPU]  WITH CHECK ADD  CONSTRAINT [FK__FortressCP__Type__5EBF139D] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[FortressCPU] CHECK CONSTRAINT [FK__FortressCP__Type__5EBF139D]
GO
ALTER TABLE [dbo].[FortressMemory]  WITH CHECK ADD  CONSTRAINT [FK__FortressM__Fortr__628FA481] FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
GO
ALTER TABLE [dbo].[FortressMemory] CHECK CONSTRAINT [FK__FortressM__Fortr__628FA481]
GO
ALTER TABLE [dbo].[FortressMemory]  WITH CHECK ADD  CONSTRAINT [FK__FortressMe__Type__6383C8BA] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[FortressMemory] CHECK CONSTRAINT [FK__FortressMe__Type__6383C8BA]
GO
ALTER TABLE [dbo].[FortressPrograms]  WITH CHECK ADD  CONSTRAINT [FK__FortressP__Fortr__7D98A078] FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FortressPrograms] CHECK CONSTRAINT [FK__FortressP__Fortr__7D98A078]
GO
ALTER TABLE [dbo].[FortressPrograms]  WITH CHECK ADD  CONSTRAINT [FK__FortressP__Progr__7CA47C3F] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FortressPrograms] CHECK CONSTRAINT [FK__FortressP__Progr__7CA47C3F]
GO
ALTER TABLE [dbo].[FortressPrograms]  WITH CHECK ADD  CONSTRAINT [FK_FortressPrograms_NetObjType] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FortressPrograms] CHECK CONSTRAINT [FK_FortressPrograms_NetObjType]
GO
ALTER TABLE [dbo].[FortressRemotes]  WITH CHECK ADD  CONSTRAINT [FK_FortressRemotes_Fortress] FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
GO
ALTER TABLE [dbo].[FortressRemotes] CHECK CONSTRAINT [FK_FortressRemotes_Fortress]
GO
ALTER TABLE [dbo].[FortressRemotes]  WITH CHECK ADD  CONSTRAINT [FK_FortressRemotes_NetObjType] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FortressRemotes] CHECK CONSTRAINT [FK_FortressRemotes_NetObjType]
GO
ALTER TABLE [dbo].[FortressSkills]  WITH CHECK ADD FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FortressSkills]  WITH CHECK ADD FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FortressWalls]  WITH CHECK ADD  CONSTRAINT [FK__FortressW__Fortr__59063A47] FOREIGN KEY([FortressID])
REFERENCES [dbo].[Fortress] ([id])
GO
ALTER TABLE [dbo].[FortressWalls] CHECK CONSTRAINT [FK__FortressW__Fortr__59063A47]
GO
ALTER TABLE [dbo].[FortressWalls]  WITH CHECK ADD  CONSTRAINT [FK__FortressWa__Type__59FA5E80] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[FortressWalls] CHECK CONSTRAINT [FK__FortressWa__Type__59FA5E80]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK__Player__aspUserI__1AF3F935] FOREIGN KEY([aspUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK__Player__aspUserI__1AF3F935]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK__Player__RoleID__6B24EA82] FOREIGN KEY([RoleID])
REFERENCES [dbo].[PlayerRoles] ([id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK__Player__RoleID__6B24EA82]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_NetObjType] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_NetObjType]
GO
ALTER TABLE [dbo].[PlayerArmor]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[ArmorLocations] ([id])
GO
ALTER TABLE [dbo].[PlayerArmor]  WITH CHECK ADD  CONSTRAINT [FK__PlayerArm__Playe__71D1E811] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
GO
ALTER TABLE [dbo].[PlayerArmor] CHECK CONSTRAINT [FK__PlayerArm__Playe__71D1E811]
GO
ALTER TABLE [dbo].[PlayerComputer]  WITH CHECK ADD FOREIGN KEY([ComputerID])
REFERENCES [dbo].[Computer] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputer]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCom__Playe__725BF7F6] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputer] CHECK CONSTRAINT [FK__PlayerCom__Playe__725BF7F6]
GO
ALTER TABLE [dbo].[PlayerComputerImprovements]  WITH CHECK ADD FOREIGN KEY([ComputerImprovementsID])
REFERENCES [dbo].[ComputerImprovements] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputerImprovements]  WITH CHECK ADD FOREIGN KEY([PlayerComputerID])
REFERENCES [dbo].[PlayerComputer] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputerOptions]  WITH CHECK ADD FOREIGN KEY([ComputerPeripheralsID])
REFERENCES [dbo].[ComputerPeripherals] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputerOptions]  WITH CHECK ADD FOREIGN KEY([PlayerComputerID])
REFERENCES [dbo].[PlayerComputer] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputerPrograms]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCom__Playe__78D3EB5B] FOREIGN KEY([PlayerComputerID])
REFERENCES [dbo].[PlayerComputer] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] CHECK CONSTRAINT [FK__PlayerCom__Playe__78D3EB5B]
GO
ALTER TABLE [dbo].[PlayerComputerPrograms]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCom__Progr__77DFC722] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] CHECK CONSTRAINT [FK__PlayerCom__Progr__77DFC722]
GO
ALTER TABLE [dbo].[PlayerComputerPrograms]  WITH CHECK ADD  CONSTRAINT [FK_PlayerComputerPrograms_NetObjType] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[PlayerComputerPrograms] CHECK CONSTRAINT [FK_PlayerComputerPrograms_NetObjType]
GO
ALTER TABLE [dbo].[PlayerCyberdeck]  WITH CHECK ADD FOREIGN KEY([CyberdeckID])
REFERENCES [dbo].[Cyberdeck] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeck]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCyb__Playe__66EA454A] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeck] CHECK CONSTRAINT [FK__PlayerCyb__Playe__66EA454A]
GO
ALTER TABLE [dbo].[PlayerCyberdeckImprovements]  WITH CHECK ADD FOREIGN KEY([CyberdeckImprovementsID])
REFERENCES [dbo].[CyberdeckImprovements] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeckImprovements]  WITH CHECK ADD FOREIGN KEY([PlayerCyberdeckID])
REFERENCES [dbo].[PlayerCyberdeck] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeckOptions]  WITH CHECK ADD FOREIGN KEY([CyberdeckOptionsID])
REFERENCES [dbo].[CyberdeckOptions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeckOptions]  WITH CHECK ADD FOREIGN KEY([PlayerCyberdeckID])
REFERENCES [dbo].[PlayerCyberdeck] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCyb__Playe__740F363E] FOREIGN KEY([PlayerCyberdeckID])
REFERENCES [dbo].[PlayerCyberdeck] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] CHECK CONSTRAINT [FK__PlayerCyb__Playe__740F363E]
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCyb__Progr__731B1205] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] CHECK CONSTRAINT [FK__PlayerCyb__Progr__731B1205]
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms]  WITH CHECK ADD  CONSTRAINT [FK_PlayerCyberdeckPrograms_NetObjType] FOREIGN KEY([Type])
REFERENCES [dbo].[NetObjType] ([id])
GO
ALTER TABLE [dbo].[PlayerCyberdeckPrograms] CHECK CONSTRAINT [FK_PlayerCyberdeckPrograms_NetObjType]
GO
ALTER TABLE [dbo].[PlayerCybernetics]  WITH CHECK ADD FOREIGN KEY([CyberneticID])
REFERENCES [dbo].[Cybernetics] ([id])
GO
ALTER TABLE [dbo].[PlayerCybernetics]  WITH CHECK ADD  CONSTRAINT [FK__PlayerCyb__Playe__7E37BEF6] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
GO
ALTER TABLE [dbo].[PlayerCybernetics] CHECK CONSTRAINT [FK__PlayerCyb__Playe__7E37BEF6]
GO
ALTER TABLE [dbo].[PlayerPrograms]  WITH CHECK ADD  CONSTRAINT [FK__PlayerPro__Playe__025D5595] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerPrograms] CHECK CONSTRAINT [FK__PlayerPro__Playe__025D5595]
GO
ALTER TABLE [dbo].[PlayerPrograms]  WITH CHECK ADD  CONSTRAINT [FK__PlayerPro__Progr__0169315C] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerPrograms] CHECK CONSTRAINT [FK__PlayerPro__Progr__0169315C]
GO
ALTER TABLE [dbo].[PlayerRoleSkills]  WITH CHECK ADD  CONSTRAINT [FK__PlayerRol__Playe__71BCD978] FOREIGN KEY([PlayerRoleID])
REFERENCES [dbo].[PlayerRoles] ([id])
GO
ALTER TABLE [dbo].[PlayerRoleSkills] CHECK CONSTRAINT [FK__PlayerRol__Playe__71BCD978]
GO
ALTER TABLE [dbo].[PlayerRoleSkills]  WITH CHECK ADD  CONSTRAINT [FK__PlayerRol__Skill__72B0FDB1] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[PlayerRoleSkills] CHECK CONSTRAINT [FK__PlayerRol__Skill__72B0FDB1]
GO
ALTER TABLE [dbo].[PlayerSkill]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSki__Playe__7A672E12] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerSkill] CHECK CONSTRAINT [FK__PlayerSki__Playe__7A672E12]
GO
ALTER TABLE [dbo].[PlayerSkill]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSki__Skill__797309D9] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerSkill] CHECK CONSTRAINT [FK__PlayerSki__Skill__797309D9]
GO
ALTER TABLE [dbo].[PlayerSkillModifiers]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSki__Playe__4F9CCB9E] FOREIGN KEY([PlayerSkillID])
REFERENCES [dbo].[PlayerSkill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerSkillModifiers] CHECK CONSTRAINT [FK__PlayerSki__Playe__4F9CCB9E]
GO
ALTER TABLE [dbo].[PlayerStat]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSta__Playe__6E01572D] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerStat] CHECK CONSTRAINT [FK__PlayerSta__Playe__6E01572D]
GO
ALTER TABLE [dbo].[PlayerStat]  WITH CHECK ADD  CONSTRAINT [FK__PlayerSta__StatI__6EF57B66] FOREIGN KEY([StatID])
REFERENCES [dbo].[Stat] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerStat] CHECK CONSTRAINT [FK__PlayerSta__StatI__6EF57B66]
GO
ALTER TABLE [dbo].[PlayerStatModifiers]  WITH CHECK ADD FOREIGN KEY([PlayerStatID])
REFERENCES [dbo].[PlayerStat] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerWeapon]  WITH CHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerWeapon]  WITH CHECK ADD FOREIGN KEY([Conc])
REFERENCES [dbo].[WeaponConcTypes] ([id])
GO
ALTER TABLE [dbo].[PlayerWeapon]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[WeaponTypes] ([id])
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD FOREIGN KEY([ProgramTypeID])
REFERENCES [dbo].[ProgramType] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramProgramFunctions]  WITH CHECK ADD FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramProgramFunctions]  WITH CHECK ADD FOREIGN KEY([ProgramFunctionID])
REFERENCES [dbo].[ProgramFunctions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramProgramOptions]  WITH CHECK ADD FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramProgramOptions]  WITH CHECK ADD FOREIGN KEY([ProgramOptionsID])
REFERENCES [dbo].[ProgramOptions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramSubroutines]  WITH CHECK ADD FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramSubroutines]  WITH CHECK ADD FOREIGN KEY([SubProgramID])
REFERENCES [dbo].[Program] ([id])
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD FOREIGN KEY([StatID])
REFERENCES [dbo].[Stat] ([id])
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD  CONSTRAINT [FK_Skill_Skill] FOREIGN KEY([id])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Skill] CHECK CONSTRAINT [FK_Skill_Skill]
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD  CONSTRAINT [FK_Skill_SkillTypes] FOREIGN KEY([SkillType])
REFERENCES [dbo].[SkillTypes] ([id])
GO
ALTER TABLE [dbo].[Skill] CHECK CONSTRAINT [FK_Skill_SkillTypes]
GO
ALTER TABLE [dbo].[Subgrid]  WITH CHECK ADD  CONSTRAINT [FK_Subgrid_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Subgrid] CHECK CONSTRAINT [FK_Subgrid_AspNetUsers]
GO
ALTER TABLE [dbo].[Weapons]  WITH CHECK ADD FOREIGN KEY([Conc])
REFERENCES [dbo].[WeaponConcTypes] ([id])
GO
ALTER TABLE [dbo].[Weapons]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[WeaponTypes] ([id])
GO
USE [master]
GO
ALTER DATABASE [Cyberpunk] SET  READ_WRITE 
GO
