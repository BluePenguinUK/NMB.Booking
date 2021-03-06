/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4435)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [NmbBooking]    Script Date: 29/01/2018 16:53:50 ******/
CREATE DATABASE [NmbBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NmbBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\NmbBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NmbBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\NmbBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NmbBooking] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NmbBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NmbBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NmbBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NmbBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NmbBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NmbBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [NmbBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NmbBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NmbBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NmbBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NmbBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NmbBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NmbBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NmbBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NmbBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NmbBooking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NmbBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NmbBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NmbBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NmbBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NmbBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NmbBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NmbBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NmbBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [NmbBooking] SET  MULTI_USER 
GO
ALTER DATABASE [NmbBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NmbBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NmbBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NmbBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NmbBooking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NmbBooking', N'ON'
GO
ALTER DATABASE [NmbBooking] SET QUERY_STORE = OFF
GO
USE [NmbBooking]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NmbBooking]
GO
/****** Object:  UserDefinedTableType [dbo].[PersonType]    Script Date: 29/01/2018 16:53:50 ******/
CREATE TYPE [dbo].[PersonType] AS TABLE(
	[Row] [int] NULL,
	[Seat] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[Location]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Rows] [int] NOT NULL,
	[Seats] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting](
	[MeetingId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Meeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[MeetingId] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[Seat] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Person_meetingid_row_seat_unq]    Script Date: 29/01/2018 16:53:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Person_meetingid_row_seat_unq] ON [dbo].[Person]
(
	[MeetingId] ASC,
	[Row] ASC,
	[Seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Person_name_email_unq]    Script Date: 29/01/2018 16:53:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Person_name_email_unq] ON [dbo].[Person]
(
	[MeetingId] ASC,
	[Name] ASC,
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_location_by_id]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- 
-- 29/01/2018	Nick Brice		Initial development - Get a location by ID
-- 
-- ============================================================================================================
CREATE PROCEDURE [dbo].[sp_location_by_id]
	@locationId INT
AS
BEGIN TRY
	SET NOCOUNT ON;

	SELECT		L.LocationId,
				L.[Name],
				L.[Rows],
				L.Seats
	FROM		dbo.[Location] L
	WHERE		L.LocationId = @locationId

	RETURN 0
END TRY
BEGIN CATCH

	--rollback any tran, if open
	IF XACT_STATE() <> 0 OR @@TRANCOUNT > 0
		ROLLBACK
	--re-raise the error (more or less)
	DECLARE @ERROR_NUMBER      int				= ERROR_NUMBER()
		,	@ERROR_SEVERITY    int				= ERROR_SEVERITY()
		,	@ERROR_STATE       int				= ERROR_STATE()
		,	@ERROR_PROCEDURE   nvarchar(255)	= ERROR_PROCEDURE()
		,	@ERROR_LINE        int				= ERROR_LINE()
		,	@ERROR_MESSAGE     nvarchar(2048)	= ERROR_MESSAGE()
	SELECT @ERROR_NUMBER [ERROR_NUMBER], @ERROR_SEVERITY [ERROR_SEVERITY], @ERROR_STATE [ERROR_STATE], @ERROR_PROCEDURE [ERROR_PROCEDURE], @ERROR_LINE [ERROR_LINE], @ERROR_MESSAGE [ERROR_MESSAGE]
	IF @ERROR_NUMBER = 50000
		RAISERROR(@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE)
	ELSE
		RAISERROR('Error %d in %s in line %d: %s', @ERROR_SEVERITY, @ERROR_STATE, @ERROR_NUMBER, @ERROR_PROCEDURE, @ERROR_LINE, @ERROR_MESSAGE)
	RETURN 1    

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_meeting_by_id]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- 
-- 29/01/2018	Nick Brice		Initial development - Get a meeting by ID
-- 
-- ============================================================================================================
CREATE PROCEDURE [dbo].[sp_meeting_by_id]
	@meetingId INT
AS
BEGIN TRY
	SET NOCOUNT ON;

	SELECT		M.MeetingId,
				M.LocationId,
				M.[Name],
				M.StartDateTime,
				M.EndDateTime
	FROM		dbo.Meeting M
	WHERE		M.MeetingId = @meetingId

	RETURN 0
END TRY
BEGIN CATCH

	--rollback any tran, if open
	IF XACT_STATE() <> 0 OR @@TRANCOUNT > 0
		ROLLBACK
	--re-raise the error (more or less)
	DECLARE @ERROR_NUMBER      int				= ERROR_NUMBER()
		,	@ERROR_SEVERITY    int				= ERROR_SEVERITY()
		,	@ERROR_STATE       int				= ERROR_STATE()
		,	@ERROR_PROCEDURE   nvarchar(255)	= ERROR_PROCEDURE()
		,	@ERROR_LINE        int				= ERROR_LINE()
		,	@ERROR_MESSAGE     nvarchar(2048)	= ERROR_MESSAGE()
	SELECT @ERROR_NUMBER [ERROR_NUMBER], @ERROR_SEVERITY [ERROR_SEVERITY], @ERROR_STATE [ERROR_STATE], @ERROR_PROCEDURE [ERROR_PROCEDURE], @ERROR_LINE [ERROR_LINE], @ERROR_MESSAGE [ERROR_MESSAGE]
	IF @ERROR_NUMBER = 50000
		RAISERROR(@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE)
	ELSE
		RAISERROR('Error %d in %s in line %d: %s', @ERROR_SEVERITY, @ERROR_STATE, @ERROR_NUMBER, @ERROR_PROCEDURE, @ERROR_LINE, @ERROR_MESSAGE)
	RETURN 1    

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_person_add_multi]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================================================
-- 
-- 29/01/2018	Nick Brice		Initial development - Add user(s) to a meeting
-- 
-- ============================================================================================================
CREATE PROCEDURE [dbo].[sp_person_add_multi]
	@meetingID INT,
	@persons PersonType READONLY,
	@message VARCHAR(1000) OUTPUT
AS
BEGIN TRY
	SET NOCOUNT ON;

	IF EXISTS (SELECT 0 FROM dbo.Person P INNER JOIN @persons A ON A.[Row] = P.[Row] AND A.Seat = P.Seat AND P.MeetingId = @meetingID)
	BEGIN
		SET @message = 'Sorry, at least one of those seats is now available. Please select new seats.'
	END
	ELSE
	BEGIN
		INSERT INTO	dbo.Person
		(
					MeetingId,
					[Row],
					Seat,
					[Name],
					Email
		)
		SELECT		@meetingID,
					[Row],
					Seat,
					[Name],
					Email
		FROM		@persons

		SET @message = NULL
	END

	RETURN 0
END TRY
BEGIN CATCH

	--rollback any tran, if open
	IF XACT_STATE() <> 0 OR @@TRANCOUNT > 0
		ROLLBACK
	--re-raise the error (more or less)
	DECLARE @ERROR_NUMBER      int				= ERROR_NUMBER()
		,	@ERROR_SEVERITY    int				= ERROR_SEVERITY()
		,	@ERROR_STATE       int				= ERROR_STATE()
		,	@ERROR_PROCEDURE   nvarchar(255)	= ERROR_PROCEDURE()
		,	@ERROR_LINE        int				= ERROR_LINE()
		,	@ERROR_MESSAGE     nvarchar(2048)	= ERROR_MESSAGE()
	SELECT @ERROR_NUMBER [ERROR_NUMBER], @ERROR_SEVERITY [ERROR_SEVERITY], @ERROR_STATE [ERROR_STATE], @ERROR_PROCEDURE [ERROR_PROCEDURE], @ERROR_LINE [ERROR_LINE], @ERROR_MESSAGE [ERROR_MESSAGE]
	IF @ERROR_NUMBER = 50000
		RAISERROR(@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE)
	ELSE
		RAISERROR('Error %d in %s in line %d: %s', @ERROR_SEVERITY, @ERROR_STATE, @ERROR_NUMBER, @ERROR_PROCEDURE, @ERROR_LINE, @ERROR_MESSAGE)
	RETURN 1    

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_persons_by_meetingid]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- 
-- 29/01/2018	Nick Brice		Initial development - Get any confirmed people by meeting ID
-- 
-- ============================================================================================================
CREATE PROCEDURE [dbo].[sp_persons_by_meetingid]
	@meetingId INT
AS
BEGIN TRY
	SET NOCOUNT ON;

	SELECT		P.PersonId,
				P.MeetingId,
				P.[Row],
				P.Seat,
				P.[Name],
				P.Email
	FROM		dbo.Person P
	WHERE		MeetingId = @meetingId

	RETURN 0
END TRY
BEGIN CATCH

	--rollback any tran, if open
	IF XACT_STATE() <> 0 OR @@TRANCOUNT > 0
		ROLLBACK
	--re-raise the error (more or less)
	DECLARE @ERROR_NUMBER      int				= ERROR_NUMBER()
		,	@ERROR_SEVERITY    int				= ERROR_SEVERITY()
		,	@ERROR_STATE       int				= ERROR_STATE()
		,	@ERROR_PROCEDURE   nvarchar(255)	= ERROR_PROCEDURE()
		,	@ERROR_LINE        int				= ERROR_LINE()
		,	@ERROR_MESSAGE     nvarchar(2048)	= ERROR_MESSAGE()
	SELECT @ERROR_NUMBER [ERROR_NUMBER], @ERROR_SEVERITY [ERROR_SEVERITY], @ERROR_STATE [ERROR_STATE], @ERROR_PROCEDURE [ERROR_PROCEDURE], @ERROR_LINE [ERROR_LINE], @ERROR_MESSAGE [ERROR_MESSAGE]
	IF @ERROR_NUMBER = 50000
		RAISERROR(@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE)
	ELSE
		RAISERROR('Error %d in %s in line %d: %s', @ERROR_SEVERITY, @ERROR_STATE, @ERROR_NUMBER, @ERROR_PROCEDURE, @ERROR_LINE, @ERROR_MESSAGE)
	RETURN 1    

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_reset_meeting]    Script Date: 29/01/2018 16:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- 
-- 29/01/2018	Nick Brice		Initial development - Get any confirmed people by meeting ID
-- 
-- ============================================================================================================
CREATE PROCEDURE [dbo].[sp_reset_meeting]
	@meetingId INT
AS
BEGIN TRY
	SET NOCOUNT ON;

	DELETE		P
	FROM		dbo.Person P
	WHERE		P.MeetingId = @meetingId

	RETURN 0
END TRY
BEGIN CATCH

	--rollback any tran, if open
	IF XACT_STATE() <> 0 OR @@TRANCOUNT > 0
		ROLLBACK
	--re-raise the error (more or less)
	DECLARE @ERROR_NUMBER      int				= ERROR_NUMBER()
		,	@ERROR_SEVERITY    int				= ERROR_SEVERITY()
		,	@ERROR_STATE       int				= ERROR_STATE()
		,	@ERROR_PROCEDURE   nvarchar(255)	= ERROR_PROCEDURE()
		,	@ERROR_LINE        int				= ERROR_LINE()
		,	@ERROR_MESSAGE     nvarchar(2048)	= ERROR_MESSAGE()
	SELECT @ERROR_NUMBER [ERROR_NUMBER], @ERROR_SEVERITY [ERROR_SEVERITY], @ERROR_STATE [ERROR_STATE], @ERROR_PROCEDURE [ERROR_PROCEDURE], @ERROR_LINE [ERROR_LINE], @ERROR_MESSAGE [ERROR_MESSAGE]
	IF @ERROR_NUMBER = 50000
		RAISERROR(@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE)
	ELSE
		RAISERROR('Error %d in %s in line %d: %s', @ERROR_SEVERITY, @ERROR_STATE, @ERROR_NUMBER, @ERROR_PROCEDURE, @ERROR_LINE, @ERROR_MESSAGE)
	RETURN 1    

END CATCH
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Seats per row' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Seats'
GO
USE [master]
GO
ALTER DATABASE [NmbBooking] SET  READ_WRITE 
GO
