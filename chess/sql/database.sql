USE [master]
GO
/****** Object:  Database [chess]    Script Date: 08/03/2016 05:53:25 PM ******/
CREATE DATABASE [chess]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'chess', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ROOT\MSSQL\DATA\chess.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'chess_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ROOT\MSSQL\DATA\chess_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [chess] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [chess].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [chess] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [chess] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [chess] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [chess] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [chess] SET ARITHABORT OFF 
GO
ALTER DATABASE [chess] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [chess] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [chess] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [chess] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [chess] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [chess] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [chess] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [chess] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [chess] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [chess] SET  DISABLE_BROKER 
GO
ALTER DATABASE [chess] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [chess] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [chess] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [chess] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [chess] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [chess] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [chess] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [chess] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [chess] SET  MULTI_USER 
GO
ALTER DATABASE [chess] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [chess] SET DB_CHAINING OFF 
GO
ALTER DATABASE [chess] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [chess] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [chess] SET DELAYED_DURABILITY = DISABLED 
GO
USE [chess]
GO
/****** Object:  User [jamchess]    Script Date: 08/03/2016 05:53:25 PM ******/
CREATE USER [jamchess] FOR LOGIN [jamchess] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [jamchess]
GO
/****** Object:  Table [dbo].[chess_game_meta_data]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[chess_game_meta_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NULL,
	[white_player] [int] NULL,
	[black_player] [int] NULL,
	[date_of_play] [datetime] NULL,
	[venue] [varchar](50) NULL,
	[tournament] [varchar](max) NULL,
	[result] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[chess_game_moves]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[chess_game_moves](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[move_no] [int] NOT NULL,
	[game_no] [int] NOT NULL,
	[move] [varchar](5) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[chess_note]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[chess_note](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[important_flag] [bit] NOT NULL,
	[note] [varchar](max) NOT NULL,
	[chess_game_id] [int] NULL,
	[chess_move_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permission]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[permission_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[permission_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[person]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[post]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_title] [varchar](max) NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_published] [datetime] NULL,
	[sticky] [bit] NOT NULL,
	[content] [binary](10) NULL,
	[post_category_id] [int] NOT NULL,
	[post_state_id] [int] NOT NULL,
	[user_created_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[post_category]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_category] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[post_state]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post_state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_state] [varchar](100) NOT NULL,
	[post_state_shortcode] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[post_state_shortcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_type]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_code] [varchar](5) NOT NULL,
	[type] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[type_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usergroup]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usergroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usergroup_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usergroup_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usergroup_permissions]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergroup_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usergroup_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
	[create] [bit] NOT NULL,
	[read] [bit] NOT NULL,
	[update] [bit] NOT NULL,
	[delete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[person_id] [int] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[user_type_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[chess_note] ADD  DEFAULT ((0)) FOR [important_flag]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((0)) FOR [sticky]
GO
ALTER TABLE [dbo].[usergroup_permissions] ADD  DEFAULT ((0)) FOR [create]
GO
ALTER TABLE [dbo].[usergroup_permissions] ADD  DEFAULT ((0)) FOR [read]
GO
ALTER TABLE [dbo].[usergroup_permissions] ADD  DEFAULT ((0)) FOR [update]
GO
ALTER TABLE [dbo].[usergroup_permissions] ADD  DEFAULT ((0)) FOR [delete]
GO
ALTER TABLE [dbo].[chess_game_meta_data]  WITH CHECK ADD FOREIGN KEY([black_player])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[chess_game_meta_data]  WITH CHECK ADD FOREIGN KEY([white_player])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[chess_note]  WITH CHECK ADD FOREIGN KEY([chess_game_id])
REFERENCES [dbo].[chess_game_meta_data] ([id])
GO
ALTER TABLE [dbo].[chess_note]  WITH CHECK ADD FOREIGN KEY([chess_move_id])
REFERENCES [dbo].[chess_game_moves] ([id])
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([post_category_id])
REFERENCES [dbo].[post_category] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([post_state_id])
REFERENCES [dbo].[post_state] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([user_created_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[usergroup_permissions]  WITH CHECK ADD FOREIGN KEY([permission_id])
REFERENCES [dbo].[permission] ([id])
GO
ALTER TABLE [dbo].[usergroup_permissions]  WITH CHECK ADD FOREIGN KEY([usergroup_id])
REFERENCES [dbo].[usergroup] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_utid] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[user_type] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_utid]
GO
/****** Object:  StoredProcedure [dbo].[create_country]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_country]
	-- Add the parameters for the stored procedure here
	@country varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @result int;
	SELECT @result = id FROM country WHERE country_name = @country;
	IF (@result IS NULL)
	BEGIN
		INSERT INTO country (country_name) VALUES (@country);
		SELECT @result = @@IDENTITY;
	END

	SELECT @result as result;

END

GO
/****** Object:  StoredProcedure [dbo].[create_person]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_person]
	-- Add the parameters for the stored procedure here
	@first_name varchar(50),
	@last_name varchar(50),
	@country_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @result int;
	IF (SELECT COUNT(*) FROM person WHERE first_name = @first_name AND last_name = @last_name) = 0
	BEGIN
		INSERT INTO person (first_name, last_name, country_id) VALUES (@first_name, @last_name, @country_id);
		SELECT @result = @@IDENTITY;
	END
	ELSE
	BEGIN
		SELECT @result = id FROM person WHERE first_name = @first_name AND last_name = @last_name;
	END

	SELECT @result as result;
END

GO
/****** Object:  StoredProcedure [dbo].[create_post_category]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_post_category]
	-- Add the parameters for the stored procedure here
	@post_category varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT * FROM post_category WHERE post_category = @post_category)
		SELECT CAST(0 as bit) result;
	ELSE
	BEGIN
		INSERT INTO post_category (post_category) VALUES (@post_category);
		SELECT @@IDENTITY as id, CAST (1 as bit) as result;
	END

END

GO
/****** Object:  StoredProcedure [dbo].[create_user]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_user]
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50),
	@email varchar(100),
	@person_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @success bit, @result int;
	IF EXISTS(SELECT * FROM users WHERE username = @username)
	BEGIN
		SET @success = 0;
	END
	ELSE
	BEGIN
		INSERT INTO users (username, [password], person_id, email) VALUES (@username, @password, @person_id, @email);
		SELECT @result = @@IDENTITY;
	END

	SELECT @success as success, @result as result;

END

GO
/****** Object:  StoredProcedure [dbo].[get_all_user_types]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_all_user_types]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, type_code, [type] as [type_desc]
	FROM user_type;

END

GO
/****** Object:  StoredProcedure [dbo].[get_post_categories]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_post_categories]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT id, post_category as category
	FROM post_category;
END

GO
/****** Object:  StoredProcedure [dbo].[get_user_password]    Script Date: 08/03/2016 05:53:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_user_password] 
	-- Add the parameters for the stored procedure here
	@id int,
	@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [password], CASE WHEN @@ROWCOUNT = 1 THEN 1 ELSE 0 END [success]
	FROM users WHERE (username = @username OR @username is null) AND (id = @id OR id is null);
END

GO
USE [master]
GO
ALTER DATABASE [chess] SET  READ_WRITE 
GO
