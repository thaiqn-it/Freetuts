USE [master]
GO
/****** Object:  Database [DBMockFreetuts]    Script Date: 5/9/2022 12:33:32 AM ******/
CREATE DATABASE [DBMockFreetuts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMockFreetuts', FILENAME = N'E:\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBMockFreetuts.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBMockFreetuts_log', FILENAME = N'E:\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBMockFreetuts_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBMockFreetuts] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBMockFreetuts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBMockFreetuts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBMockFreetuts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBMockFreetuts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBMockFreetuts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBMockFreetuts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBMockFreetuts] SET  MULTI_USER 
GO
ALTER DATABASE [DBMockFreetuts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBMockFreetuts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBMockFreetuts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBMockFreetuts] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBMockFreetuts] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBMockFreetuts', N'ON'
GO
USE [DBMockFreetuts]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admins](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[fullname] [nvarchar](50) NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[description] [ntext] NULL,
	[name] [nvarchar](50) NULL,
	[thumbnail] [varchar](255) NULL,
	[created_by] [bigint] NULL,
	[parent_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comments]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[comment] [ntext] NULL,
	[commenter_email] [varchar](255) NULL,
	[commenter_name] [nvarchar](50) NULL,
	[date] [datetime2](7) NULL,
	[course_id] [bigint] NULL,
	[post_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[courses]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[course_link] [varchar](255) NULL,
	[created_date] [datetime2](7) NULL,
	[description] [ntext] NULL,
	[learn_method] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[price] [bigint] NULL,
	[thumbnail] [varchar](255) NULL,
	[category] [bigint] NULL,
	[created_by] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[discount_code] [varchar](255) NULL,
	[discount_percent] [int] NULL,
	[discount_website] [varchar](255) NULL,
	[provider] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[address] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[facebook] [varchar](255) NULL,
	[name] [nvarchar](50) NULL,
	[phone] [varchar](255) NULL,
	[price] [float] NULL,
	[payment_method] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payment_methods]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_methods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[posts]    Script Date: 5/9/2022 12:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[posts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[content_file] [varchar](255) NULL,
	[created_date] [datetime2](7) NULL,
	[description] [ntext] NULL,
	[name] [nvarchar](255) NULL,
	[thumbnail] [varchar](255) NULL,
	[category] [bigint] NULL,
	[created_by] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admins] ON 

INSERT [dbo].[admins] ([id], [available], [fullname], [password], [username]) VALUES (1, 1, N'Administrator', N'$2a$10$ddMpp822Jzi2rl3I61GOZOpn2S4VJXfqGkFyA1YLy/Zve66gmvAR6', N'admin')
INSERT [dbo].[admins] ([id], [available], [fullname], [password], [username]) VALUES (2, 1, N'Thai 2', N'$2a$10$YKp8mc9UfrYhRpXaVCY6jep30kXSsgGrV9vcD7X0qaoITnzkgKWWm', N'admin2')
INSERT [dbo].[admins] ([id], [available], [fullname], [password], [username]) VALUES (3, 1, N'12312323', N'$2a$10$RZIWtx9ER5CzROqWUIHBeemMhzHgtPcMTYaMUA4/plFhLuAiHJLj.', N'admin3')
SET IDENTITY_INSERT [dbo].[admins] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (1, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Lập trình', N'', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (2, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Programming', N'', NULL, 1)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (3, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Frontend Web', N'learn.png', NULL, 1)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (4, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Python', N'learn.png', NULL, 2)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (5, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Java 2222', N'', NULL, 2)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (6, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Ruby', N'learn.png', NULL, 2)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (7, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'HTML & CSS', N'learn.png', NULL, 3)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (8, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Boootstrap', N'learn.png', NULL, 3)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (9, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Javascript', N'learn.png', NULL, 3)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (10, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Java Core', N'learn.png', NULL, 5)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (11, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'JSP/Servlet', N'learn.png', NULL, 5)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (12, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Spring', N'learn.png', NULL, 5)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (13, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Python Basic', N'learn.png', NULL, 4)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (14, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Machine Learning', N'learn.png', NULL, 4)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (15, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Python Advanced', N'learn.png', NULL, 4)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (16, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Tin học', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (17, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Word', N'learn.png', NULL, 16)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (18, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Excel', N'learn.png', NULL, 16)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (19, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Powerpoint', N'learn.png', NULL, 16)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (20, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Access', N'learn.png', NULL, 16)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (21, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Photoshop', N'learn.png', NULL, 16)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (22, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Web Backend', N'learn.png', NULL, 1)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (23, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'PHP', N'learn.png', NULL, 22)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (24, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Laravel', N'learn.png', NULL, 22)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (25, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'NodeJS', N'learn.png', NULL, 22)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (26, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Mobile Dev', N'learn.png', NULL, 1)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (27, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'ReactNative', N'learn.png', NULL, 26)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (28, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Android', N'learn.png', NULL, 26)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (29, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'iOS', N'learn.png', NULL, 26)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (30, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Công cụ', N'learn.png', NULL, 1)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (31, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Học Git', N'learn.png', NULL, 30)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (32, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Testing', N'learn.png', NULL, 30)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (33, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'DevTool', N'learn.png', NULL, 30)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (34, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Khóa học', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (35, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Khóa học lập trình', N'learn.png', NULL, 34)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (36, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Khóa học tin học VP', N'learn.png', NULL, 34)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (37, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Khóa học thiết kế', N'learn.png', NULL, 34)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (38, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Mã giảm giá', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (39, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Tinohost', N'learn.png', NULL, 38)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (40, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Azdigi', N'learn.png', NULL, 38)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (41, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Vultr', N'learn.png', NULL, 38)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (42, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Website', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (43, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Hosting tốt nhất', N'learn.png', NULL, 42)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (44, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'VPS tốt nhất', N'learn.png', NULL, 42)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (45, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Mua domain ở đâu', N'learn.png', NULL, 42)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (46, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Kiến thức domain', N'learn.png', NULL, 42)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (47, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Thủ thuật', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (48, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Điện thoại', N'learn.png', NULL, 47)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (49, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Game', N'learn.png', NULL, 47)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (50, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Download', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (51, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Phần mềm', N'learn.png', NULL, 50)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (52, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Tài liệu', N'learn.png', NULL, 50)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (53, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Font chữ', N'learn.png', NULL, 50)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (54, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Môn học', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (55, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Toán', N'learn.png', NULL, 54)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (56, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Tiếng Anh', N'learn.png', NULL, 54)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (57, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Văn học', N'learn.png', NULL, 54)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (58, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Marketing', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (59, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Digital Marketing', N'learn.png', NULL, 58)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (60, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Trade Coin', N'learn.png', NULL, 58)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (61, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Khám phá', N'learn.png', NULL, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (62, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Tài chính', N'learn.png', NULL, 61)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (63, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Sức khỏe', N'learn.png', NULL, 61)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (64, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Ẩm thực', N'learn.png', NULL, 61)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (65, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Học HTML căn bản & nâng cao', N'learn.png', NULL, 7)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (66, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Học HTML5 căn bản & nâng cao', N'learn.png', NULL, 7)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (67, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'HTML5 Canvas', N'learn.png', NULL, 7)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (68, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', N'Bài tập Java', N'learn.png', NULL, 5)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (69, 1, N'Cái này test', N'Một cái parent mới', N'learn.png', 1, 75)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (70, 1, N'dadads', N'Một cái parent mới nè', N'4.jpg', 1, 58)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (71, 1, N'huhu', N'jjjj', N'learn.png', 1, 72)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (72, 1, N'asdsad', N'con của Một cái parent mới', N'4.jpg', 1, 69)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (73, 1, N'23123', N'Con 2', N'learn.png', 1, 74)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (74, 1, N'adasd', N'con của con 2', N'4.jpg', 1, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (75, 1, N'asdsad', N'con của j', N'learn.png', 1, NULL)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (76, 1, N'23123', N'con 2 của j', N'learn.png', 1, 71)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (77, 1, N'sadad', N'con của con 2 của j', N'learn.png', 1, 76)
INSERT [dbo].[category] ([id], [available], [description], [name], [thumbnail], [created_by], [parent_id]) VALUES (78, 1, N'sadsad', N'Sub lap trinh', N'4.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [available], [comment], [commenter_email], [commenter_name], [date], [course_id], [post_id]) VALUES (1, 1, N'Test comment 1', N'test@gmail.com', N'Test 1', CAST(N'2020-08-08 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[comments] ([id], [available], [comment], [commenter_email], [commenter_name], [date], [course_id], [post_id]) VALUES (2, 1, N'Test comment 2', N'test2@gmail.com', N'Test 2', CAST(N'2020-08-08 00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[comments] ([id], [available], [comment], [commenter_email], [commenter_name], [date], [course_id], [post_id]) VALUES (3, 1, N'Test comment 3', N'test3@gmail.com', N'Test 3', CAST(N'2020-08-08 00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[comments] ([id], [available], [comment], [commenter_email], [commenter_name], [date], [course_id], [post_id]) VALUES (4, 1, N'<p>hihih</p>', N'thai_drm@yahoo.com.vn', N'THai', NULL, NULL, 31)
INSERT [dbo].[comments] ([id], [available], [comment], [commenter_email], [commenter_name], [date], [course_id], [post_id]) VALUES (5, 1, N'<p>hello</p>', N'hthai@sd', N'thai', NULL, NULL, 56)
SET IDENTITY_INSERT [dbo].[comments] OFF
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [available], [course_link], [created_date], [description], [learn_method], [name], [price], [thumbnail], [category], [created_by]) VALUES (1, 1, N'https://youtube.comfasfafaffsafa', NULL, N'aa', N'test', N'Thiết kế Javascript và illustrator', 180000, N'learn.png', 37, 1)
INSERT [dbo].[courses] ([id], [available], [course_link], [created_date], [description], [learn_method], [name], [price], [thumbnail], [category], [created_by]) VALUES (2, 1, N'https://youtube.com', NULL, N'test', N'test', N'Thành thạo học văn phòng (MS Office / Internet / Windows)', 2390000, N'post.jpeg', 36, 1)
INSERT [dbo].[courses] ([id], [available], [course_link], [created_date], [description], [learn_method], [name], [price], [thumbnail], [category], [created_by]) VALUES (3, 1, N'youtube.com', NULL, N'aa', N'aa', N'Khóa học test trong thiết kế UI/UX (HP 6.4)', 199000, N'post.jpeg', 37, 1)
SET IDENTITY_INSERT [dbo].[courses] OFF
SET IDENTITY_INSERT [dbo].[discounts] ON 

INSERT [dbo].[discounts] ([id], [available], [discount_code], [discount_percent], [discount_website], [provider]) VALUES (1, 1, N'freetuts60', 60, N'https://unica.vn/?aff=2560&amp;amp;amp;amp;amp;src=ft.sidebar.coupon', N'Unica')
INSERT [dbo].[discounts] ([id], [available], [discount_code], [discount_percent], [discount_website], [provider]) VALUES (2, 1, N'TINO30_2020', 30, N'https://tinohost.com/', N'TinoHost')
INSERT [dbo].[discounts] ([id], [available], [discount_code], [discount_percent], [discount_website], [provider]) VALUES (3, 1, N'INET30UP', 30, N'https://inet.vn/?aff=158288', N'INET')
SET IDENTITY_INSERT [dbo].[discounts] OFF
INSERT [dbo].[order_details] ([order_id], [course_id]) VALUES (4, 2)
INSERT [dbo].[order_details] ([order_id], [course_id]) VALUES (5, 1)
INSERT [dbo].[order_details] ([order_id], [course_id]) VALUES (6, 2)
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [available], [address], [email], [facebook], [name], [phone], [price], [payment_method]) VALUES (4, 1, N'USA', N'thai_dtm@yahoo.com.vn', N'thai12_dsd@facebook.com', N'Thái 123', N'13141414', 210000, 1)
INSERT [dbo].[orders] ([id], [available], [address], [email], [facebook], [name], [phone], [price], [payment_method]) VALUES (5, 1, N'VN,', N'thai_dtm@yahoo.com.vn', N'thai12_dsd@facebook.com', N'Thái 456', N'13141414', 180000, 4)
INSERT [dbo].[orders] ([id], [available], [address], [email], [facebook], [name], [phone], [price], [payment_method]) VALUES (6, 1, N'VN,', N'thai_dtm@yahoo.com.vn', N'thai12_dsd@facebook.com', N'Thiết kế Javascript và illustrator', N'13141414', 2390000, 1)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[payment_methods] ON 

INSERT [dbo].[payment_methods] ([id], [available], [name]) VALUES (1, 1, N'Thanh toán qua ngân hàng')
INSERT [dbo].[payment_methods] ([id], [available], [name]) VALUES (2, 1, N'Thanh toán qua bưu điện')
INSERT [dbo].[payment_methods] ([id], [available], [name]) VALUES (3, 1, N'Thanh toán qua paypal')
INSERT [dbo].[payment_methods] ([id], [available], [name]) VALUES (4, 1, N'Thanh toán qua ví momo')
SET IDENTITY_INSERT [dbo].[payment_methods] OFF
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (1, 1, N'huong-dan-download-va-cai-dat-python-tren-window-194.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn các bạn cách tải Python cho Win7 / Win 10, sau khi tải về bạn có thể bắt đầu cài đặt Python trên Win 7 / Win 10 để học series Python này.', N'Hướng dẫn download và cài đặt python trên Window (Win 7 / Win 10) 2', N'post.jpeg', 36, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (2, 1, N'Cai-dat-Intellij-IDEA-va-chay-Hello-World-trong-Python.2.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn các bạn cách cài đặt phần mềm Intellij IDEA để học Python, đây là một phần mềm rất hay và được sử dụng để code nhiều ngôn ngữ, trong đó có Python.', N'Cài đặt Intellij IDEA và chạy Hello World trong Python', N'', 13, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (3, 1, N'cach-khai-bao-bien-trong-python-3422.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài học này chúng ta sẽ tìm hiểu cách khai báo biến trong Python, qua bài này bạn sẽ biết cách tạo và sử dụng biến cũng như gán dữ liệu cho biến bằng Python.', N'Cách khai báo biến trong Python', N'post.jpeg', 13, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (4, 1, N'comment-trong-python-195.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn các bạn cách tạo comment trong Python, đây là cách giúp bạn tạo ra những ghi chú trong lúc lập trình với ngôn ngữ Python.', N'Cách tạo comment trong Python', N'post.jpeg', 13, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (5, 1, N'Cac-kieu-du-lieu-trong-Python.5.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ giới thiệu các kiểu dữ liệu trong Python, qua bài này bạn sẽ hiểu được cách sử dụng các kiểu dữ liệu thường dùng nhất của Python.', N'Các kiểu dữ liệu trong Python', N'', 13, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (6, 1, N'ep-kieu-du-lieu-trong-python-1702.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn các bạn cách chuyển đổi và ép kiểu trong Python, đây là thao tác thường được sử dụng trong thực tế khi làm việc với Python. Trước khi vào bài mới thì bạn hãy quay lại bài cũ để xem các kiểu dữ liệu trong Python đã nhé, sau đó chúng ta sẽ tiếp tục với phần dưới đây.', N'Cách ép kiểu dữ liệu trong Python', N'post.jpeg', 13, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (7, 1, N'cac-toan-tu-trong-python-3423.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ giới thiệu đến các bạn danh sách các toán tử trong Python, đây là những toán tử được sử dụng rất thường xuyên khi lập trình Python.', N'Các toán tử trong Python', N'post.jpeg', 13, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (8, 1, N'cai-dat-anaconda-3416.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ tìm hiểu khái niệm Anaconda là gì, đồng thời mình cũng hướng dẫn cách cài đặt Anaconda để bắt đầu học Data Science nhé.', N'Anaconda là gì? Cài đặt Anaconda trên Windows - Linux - Mac OS', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (9, 1, N'huong-dan-cai-dat-va-su-dung-jupyter-notebook-3425.html', CAST(N'2021-03-01 00:00:00.0000000' AS DateTime2), N'Nếu bạn là người mới và thắc mắc muốn tìm một công cụ nào giúp phát triển cũng như hỗ trợ tương tác cho project về data science, thì có lẽ hầu hết mọi người sẽ trả lời là Jupyter Notebook.', N'Hướng dẫn cài đặt và sử dụng Jupyter Notebook', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (10, 1, N'cai-dat-package-python-3504.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn các bạn cách cài đặt package Python với pip, đây là lệnh giúp bạn install package, update package trong Python một cách dễ dàng.', N'Hướng dẫn cài đặt package Python với pip', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (11, 1, N'multiprocessing-trong-python-3502.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ tìm hiểu xử lý đa tiến trình trong Python. Đa xử lý hay còn gọi là multiprocessing, thường được dùng để xử lý nhiều tiến trình chạy song song.', N'Multiprocessing trong Python (xử lý đa tiến trình)', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (12, 1, N'xu-ly-mysql-trong-python-3503.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn cách dùng module mysql-connector-python để xử lý kết nối và truy vấn MySQL. Các thao tác trong MySQL cơ bản như kết nối / insert / update / delete và select.', N'Xử lý MySQL trong Python (insert / update / delete / select)', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (13, 1, N'google-translator-trong-python-3507.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài học này chúng ta sẽ tìm hiểu googletrans, hay còn gọi là Python Google Translator, đây là một module dùng để dịch văn bản qua các ngôn ngữ bằng cách sử dụng Google API.', N'Cách sử dụng Google Translator trong Python', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (14, 1, N'json-trong-python-3508.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn cách xử lý chuỗi JSON trong Python, bằng cách sử dụng module json bạn có thể chuyển chuỗi JSON thành dữ liệu có cấu trúc trong Python.', N'Xử lý chuỗi JSON trong Python', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (15, 1, N'random-trong-python-3509.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ hướng dẫn bạn cách tạo số ngẫu nhiên bằng cách sử dụng module random trong Python. Với module này bạn có thể tạo ra một số ngẫu nhiên bất kì dựa với nhiều yêu cầu khác nhau.', N'Random trong Python: Tạo số random ngẫu nhiên', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (16, 1, N'quan-ly-sinh-vien-voi-mysql-va-python-3505.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ làm một bài tập, đó là xây dựng ứng dụng quản lý sinh viên với MySQL và Python cơ bản, qua đó bạn sẽ biết cách xử lý truy vấn CSDL MySQL bằng Python.', N'Ứng dụng quản lý sinh viên với MySQL và Python cơ bản', N'post.jpeg', 14, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (17, 1, N'dictionary-keys.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Phương thức dictionary keys() dùng để lấy danh sách các key và trả về một object chứa tất cả các key trong dictionary đó. Object này sẽ được thể hiện định dạng list.', N'Hàm Dictionary keys() trong Python', N'post.jpeg', 15, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (18, 1, N'dictionary-items.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Phương thức items() dùng để hiển thị danh sách tất cả các phần tử trong dictionary dưới dạng một Tuple, tức là mỗi phần tử sẽ được thể hiện định dạng (key, value).', N'Hàm Dictionary items() trong Python', N'post.jpeg', 15, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (19, 1, N'dictionary-get.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Phương thức get() dùng để lấy một phần tử trong dictionary dựa vào tên key mà ta truyền vào. Get() có hai tham số và ta sẽ lần lượt tìm hiểu ở các phần dưới đây.', N'Hàm Dictionary get() trong Python', N'post.jpeg', 15, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (20, 1, N'dictionary-fromkeys.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Phương thức fromkeys() dùng để tạo ra một dictionary mới dựa vào bộ key được cung cấp bởi người dùng fromkeys() rất hữu ích trong trường hợp bạn muốn tạo ra một dictionary khi đã có danh sách các key và giá trị sẵn.', N'Hàm Dictionary fromkeys() trong Python', N'post.jpeg', 15, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (21, 1, N'dictionary-copy.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ tìm hiểu phương thức dict copy(), phương thức này có công dụng trả về một bản copy nông của dictionary.', N'Hàm Dictionary copy() trong Python', N'post.jpeg', 15, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (22, 1, N'dictionary-clear.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ tìm hiều phương thức Dictionary clear() trong Python, đây là phương thức dùng để xóa tất cả các phần tử ra khỏi Dictionary.', N'Hàm Dictionary clear() trong Python', N'post.jpeg', 15, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (23, 1, N'java-la-gi-gioi-thieu-ngon-ngu-java-1023.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài đầu tiên về series tự học Java cơ bản (Java Core) này, chúng ta sẽ lần lượt tìm hiểu về khái niệm Java là gì, sự hình thành của ngôn ngữ này, vì sao ngôn ngữ này lại được đặt tên là Java? Bên cạnh đó, bài viết này cũng sẽ lần lượt giới thiệu những đặc điểm cơ bản và ứng dụng của ngôn ngữ Java và các Platform cơ bản của ngôn ngữ lập trình Java.', N'Java là gì? Giới thiệu ngôn ngữ Java', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (24, 1, N'huong-dan-cai-dat-cau-hinh-va-thiet-lap-bien-moi-truong-cho-java-1024.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Ở bài trước, chúng ta đã tìm hiểu những khái niệm tổng quan, đặc điểm về ngôn ngữ lập trình Java. Trong bài này, tôi sẽ hướng dẫn chi tiết cách cài đặt và cấu hình môi trường JDK (Java Development Kit) để lập trình Java trên hệ điều hành Windows. Đây là một bài khá quan trọng vì khi chúng ta muốn lập trình với bất kỳ loại ngôn ngữ nào thì trước tiên chúng ta cần phải cài đặt đầy đủ và cấu hình các yếu tố cần thiết mà ngôn ngữ đó yêu cầu.', N'Hướng dẫn cài đặt, cấu hình và thiết lập biến môi trường cho Java', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (25, 1, N'huong-dan-cai-dat-cau-hinh-va-cach-su-dung-eclipse-1026.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Ở những bài trước, chúng ta đã tìm hiểu những khái niệm tổng quan, đặc điểm về ngôn ngữ lập trình Java cũng như cách cài đặt, cấu hình và thiết lập biến môi trường JDK để  tiến hành lập trình với Java. Trong bài này, chúng ta sẽ cùng nhau tìm hiểu về cách cài đặt, cấu hình và sử dụng Eclipse - một công cụ dùng để lập trình Java được rất nhiều lập trình viên sử dụng bởi vì Eclipse có thể chạy được trên nhiều nền tảng hệ điều hành khác nhau như Windows, Linux, Mac OS... cũng như có thể tích hợp được nhiều thư viện khác nhau phục vụ cho việc lập trình web và lập trình với cơ sở dữ liệu... Bây giờ chúng ta bắt đầu nhé!', N'Hướng dẫn cài đặt, cấu hình và cách sử dụng Eclipse', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (26, 1, N'chuong-trinh-java-dau-tien-hello-world-1031.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này, tôi sẽ hướng dẫn các bạn từng bước tạo một project trong Java thông qua chương trình HelloWorld. Đây là một chương trình rất phổ biến và tất cả các ngôn ngữ lập trình khác đều sử dụng trong bước đầu làm quen với ngôn ngữ đó. Chương trình này sẽ hiển thị ra màn hình Console dòng thông báo "Hello World". Trong bài này có sử dụng lệnhSystem.out.println(); để xuất thông báo ra màn hình và trong bài tiếp theo tôi sẽ nói rõ hơn về dòng lệnh này.', N'Chương trình Java đầu tiên - HelloWorld', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (27, 1, N'cu-phap-va-quy-tac-java-co-ban-1028.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này, chúng ta sẽ cùng nhau tìm hiểu về một số cú pháp và quy tắc cơ bản trong Java. Đây là một bài rất quan trong, các bạn cần phải nắm rõ các quy tắc và cú pháp có trong bài viết này để có thể lập trình tốt hơn với ngôn ngữ lập trình Java. ', N'Cú pháp và quy tắc Java cơ bản
', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (28, 1, N'cac-kieu-du-lieu-trong-java-1037.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong các bài trước, tôi đã hướng dẫn các bạn về những vấn đề cơ bản nhất trước khi học lập trình với Java. Kể từ bài này trở đi, chúng ta sẽ bắt đầu bước vào tìm hiểu sâu hơn về những khái niệm cần thiết để có thể lập trình Java và có thể giải quyết được những vấn đề mà các bạn gặp phải.', N'Các kiểu dữ liệu trong Java', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (29, 1, N'bien-va-hang-so-trong-java-1038.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài trước, tôi đã giới thiệu cho các bạn khái niệm về kiểu dữ liệu trong Java và 2 kiểu dữ liệu thường gặp đó là Primitive data (Kiểu dữ liệu cơ sở) và Wrapper class. Trong bài này, chúng ta sẽ đi qua hai khái niệm quan trọng khác đó là khái niệm biến (Variable) và hằng số (Constant) trong Java.', N'Biến và hằng số trong Java', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (30, 1, N'cac-toan-tu-thuong-dung-trong-java-1048.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài ngày hôm nay, tôi sẽ giới thiệu đến các bạn các toán tử cơ bản (Basic Operators) trong Java. Sau đó, tôi sẽ đưa ra một ví dụ tổng hợp những gì chúng ta học từ đầu series tới giờ và có sử dụng các loại toán tử này. Trong phần bài tập, tôi cũng sẽ đưa ra một số dạng bài tập cho các bạn tham khảo.', N'Các toán tử thường dùng trong Java', N'post.jpeg', 10, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (31, 1, N'cong-hai-so-trong-java-2556.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ viết một chương trình cộng hai số trong Java, với bài tập này sẽ giúp bạn hiểu được cách sử dụng toán tử cộng trong Java.', N'Cộng hai số trong Java', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (32, 1, N'Kiem-tra-so-chan-hay-so-le-trong-Java.32.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Ở bài này chúng ta sẽ thực hiện kiểm tra một số là số chẵn hay số lẻ bằng Java, bài tập này giúp các bạn nắm rõ hơn về câu lênh if và else.', N'Kiểm tra số chẵn hay số lẻ trong Java', N'', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (33, 1, N'cong-hai-so-phuc-trong-java-2558.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ viết một chương trình tính tổng của hai số phức trong java, với bài tập này các bạn sẽ nắm rõ hơn về cách tạo hàm và sử dụng hàm trong java.', N'Cộng hai số phức trong java
', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (34, 1, N'nhan-hai-so-trong-java-2559.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ viết một chương trình nhân hai số trong Java, với bài tập này sẽ giúp bạn hiểu được cách sử dụng toán tử nhân trong Java.', N'Nhân hai số trong java', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (35, 1, N'kiem-tra-nam-nhuan-trong-java-2560.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ thực hiện chương trình kiểm tra năm nhuận trong Java, nó sẽ giúp các bạn hiểu rõ hơn về câu lệnh if, else trong java.', N'Kiểm tra năm nhuận trong java', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (36, 1, N'kiem-tra-nguyen-am-va-phu-am-trong-java-2562.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ thực hiện chương trình kiểm tra nguyên âm và phụ âm trong java, đây là các ký tự phát ẩm chuẩn trong tiếng Anh.', N'Kiểm tra nguyên âm và phụ âm trong java', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (37, 1, N'tinh-lai-xuat-kep-trong-java-2563.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ viết một chương trình để tính lãi xuất kép bằng ngôn ngữ Java, đây là công thức được sử dụng nhiều trong ngành kế toán tài chính.', N'Tính lãi xuất kép trong java
', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (38, 1, N'tinh-lai-xuat-trong-java-2564.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ thực hiện một chương trình tính lãi xuất đơn giản trong java, đây là công thức khá đơn giản và được sử dụng nhiều khi vay vốn.', N'Tính lãi xuất trong java
', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (39, 1, N'tim-phan-nguyen-va-phan-du-trong-java-2566.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài tập này chúng ta sẽ thực hiện chương trình tìm phần nguyên và phần dư của một số chia cho số khác bằng ngôn ngữ Java. Bạn sẽ vận dụng toán tử % để chia lấy phần dư và / để chia lấy phần nguyên.', N'Tìm phần nguyên và phần dư trong java', N'post.jpeg', 68, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (40, 1, N'lambda-expressions-trong-java-8-3013.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này chúng ta sẽ tìm hiểu về Lambda Expressions trong Java 8, đây là tính năng được thêm vào kể từ phiên bản Java SE 8 nên rất mới.', N'Lambda Expressions trong Java 8
', N'post.jpeg', 12, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (41, 1, N'method-references-trong-java-8-3014.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Ở bài trước mình đã giới thiệu cách sử dụng lambda expressions rồi, vậy thì bài này ta sẽ bàn về một vấn đề có liên quan mật thiết, đó là phương thức tham chiếu (Method References).', N'Method References (phương thức tham chiếu) trong Java 8', N'post.jpeg', 12, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (42, 1, N'html-la-gi-bo-cuc-html-cua-mot-trang-web-420.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Khi bắt đầu làm quen với lập trình web thì HTML chính là nội dung đầu tiên mà bạn phải học, sau đó bạn sẽ kết hợp với CSS để tạo ra những sản phảm rất là độc đáo. Nghe nói thì hay nhưng bạn mới học nên có lẽ hơi mơ hồ phải không nào :D Ok trong serie này ta  sẽ cùng nhau khám phá nhé.', N'Bài 01: HTML là gì? Bổ cục HTML của một trang web', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (43, 1, N'html-elements-va-attributes-421.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Ở bài HTML là gì mình có nói HTML bản chất giống XML nên nó được tạo thành từ hai thành phần chính đó là tên thẻ (tagname) và các thuộc tính (attribute). Đối với XML thì tên thẻ ta có thể tự định nghĩa nhưng với HTML thì bạn phải sử dụng tên thẻ có trong danh sách HTML Elements, nếu không trình duyệt sẽ không hiểu thẻ mà bạn đang sử dụng là gì.', N'Bài 02: HTML Elements và Attributes', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (44, 1, N'cac-the-html-dinh-dang-van-ban-119.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Kể từ bài này chúng ta bắt đầu tìm hiểu các thẻ HTML thông dụng thường được sử dụng, sau đó chúng ta sẽ áp dụng CSS để xây dựng bổ cục giúp website đẹp hơn. Các thẻ HTML mình trình bày tương đối đơn giản nên bạn có thể sử dụng google để tìm kiếm bất kì một blog lập trình nào.', N'Bài 03: Các thẻ HTML định dạng văn bản', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (45, 1, N'cac-the-html-dinh-dang-heading-va-list-120.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong bài này mình sẽ tìm hiểu hai nhóm thẻ dùng để nhấn mạnh nội dung của một trang web và chia ra từng mục lục giúp cho trang web dễ nhìn hơn. Vấn đề này không những thân thiện với người dùng mà nó còn có tác dụng khá tốt trong việ SEO website.', N'Bài 04: Các thẻ HTML định dạng heading và list', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (46, 1, N'cac-the-html-dinh-dang-table-121.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Table là một định dạng dùng để hiển thị dữ liệu ở dạng danh sách. Mỗi table sẽ được chia ra gồm hai thành phần là cột với hàng, và được tạo thành bởi các thẻ table, tr, td, tbody, thead, tfoot.', N'Bài 05: Các thẻ HTML định dạng Table', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (47, 1, N'dung-the-a-trong-html-de-tao-links-335.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Trong một website luôn tồn tại các link liên kết với nhau. Ví dụ như bài HTML là gì mình đã gán một link tới trang trình bày khái niệm đó. Vậy thì trong bài này chúng ta tìm hiểu cách sử dụng thẻ a để tạo nên những link liên kết như vậy.', N'Bài 06: Dùng thẻ a trong HTML để tạo links', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (48, 1, N'dung-the-img-trong-html-de-tao-hinh-anh-123.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Có câu "một website đẹp phải có hình ảnh, bổ cục rõ ràng và nhiều hiệu ứng bắt mắt". Chỉ với câu nói này thôi đủ để chúng ta liệt kê những công nghệ phải sử dụng để tạo nên nó.', N'Bài 07: Dùng thẻ img trong HTML để tạo hình ảnh', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (49, 1, N'su-dung-css-tuy-chinh-giao-dien-html-437.html', CAST(N'2021-01-03 00:00:00.0000000' AS DateTime2), N'Theo mặc định giao diện của các thẻ HTML sẽ không đẹp và không thể nào làm giống như giao diện trong file PSD được, vì vậy ta phải sử dụng thêm CSS để tùy chỉnh hiển thị mặc định của HTML.', N'Bài 08: Sử dụng CSS tùy chỉnh giao diện HTML', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (50, 1, N'neee.html', CAST(N'2021-04-02 14:35:32.2390000' AS DateTime2), N'm', N'neee', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (51, 1, N'TEST123.html', CAST(N'2021-04-02 14:40:57.4120000' AS DateTime2), N'sdfaf', N'TEST123', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (52, 1, N'fixed.html', CAST(N'2021-04-02 16:41:36.7470000' AS DateTime2), N'sdasdasd', N'fixed', N'post.jpeg', 65, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (53, 1, N'fixed-v2.html', CAST(N'2021-04-02 16:42:40.6220000' AS DateTime2), N'123123', N'fixed v2', N'post.jpeg', 6, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (54, 1, N'a-a-a-a-a-a-a-a-a-a--a-a.html', CAST(N'2021-04-05 11:17:00.6050000' AS DateTime2), N'asdasd', N'a~a*a/a:a<a>a?a|a a" a\a', N'post.jpeg', 70, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (55, 1, N'tinohost-black-friday-2020-68', CAST(N'2021-04-05 11:17:00.6050000' AS DateTime2), N'11111', N'Coupon 1', N'post.jpeg', 39, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (56, 1, N'tinohost-black-friday-2020-68', CAST(N'2021-04-05 11:17:00.6050000' AS DateTime2), N'2', N'Coupon 2', N'post.jpeg', 39, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (57, 1, N'tinohost-black-friday-2020-68', CAST(N'2021-04-05 11:17:00.6050000' AS DateTime2), N'2', N'Coupon 3', N'post.jpeg', 39, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (58, 1, N'fixed.html', CAST(N'2021-04-05 11:17:00.6050000' AS DateTime2), N'asdasdsd', N'sdasd', N'post.jpeg', 70, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (59, 1, N'tinohost-black-friday-2020-68', CAST(N'2021-04-05 11:17:00.6050000' AS DateTime2), N'2', N'Coupon 4', N'post.jpeg', 39, 1)
INSERT [dbo].[posts] ([id], [available], [content_file], [created_date], [description], [name], [thumbnail], [category], [created_by]) VALUES (60, 1, N'Hoc-javascript-sieu-cap-vip-pro-047714.html', CAST(N'2021-07-09 20:43:29.5890000' AS DateTime2), N'Video javascript siêu hay chỉ 5p', N'Học javascript siêu cấp vip pro', N'', 9, 1)
SET IDENTITY_INSERT [dbo].[posts] OFF
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK2y94svpmqttx80mshyny85wqr] FOREIGN KEY([parent_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK2y94svpmqttx80mshyny85wqr]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FKnkch3vybj4upx1xl78ov5ty9d] FOREIGN KEY([created_by])
REFERENCES [dbo].[admins] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FKnkch3vybj4upx1xl78ov5ty9d]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK7ktrfqv6fgfuw6fvwludvibu4] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK7ktrfqv6fgfuw6fvwludvibu4]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKh4c7lvsc298whoyd4w9ta25cr] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKh4c7lvsc298whoyd4w9ta25cr]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FKshmsyevr67v5wew4n13seeom] FOREIGN KEY([category])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FKshmsyevr67v5wew4n13seeom]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FKtl5arodbfn11145rxamgp4ciy] FOREIGN KEY([created_by])
REFERENCES [dbo].[admins] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FKtl5arodbfn11145rxamgp4ciy]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKtc2uxybe6r9ak6sd66whjd27] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKtc2uxybe6r9ak6sd66whjd27]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK4q9i5ocee718mqyc415foi9ct] FOREIGN KEY([payment_method])
REFERENCES [dbo].[payment_methods] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK4q9i5ocee718mqyc415foi9ct]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK2m8b06ehet1pou9659xml0psg] FOREIGN KEY([category])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK2m8b06ehet1pou9659xml0psg]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK90u8ujbk7okkvyyxyhpr50g88] FOREIGN KEY([created_by])
REFERENCES [dbo].[admins] ([id])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK90u8ujbk7okkvyyxyhpr50g88]
GO
USE [master]
GO
ALTER DATABASE [DBMockFreetuts] SET  READ_WRITE 
GO
