USE [master]
GO
/****** Object:  Database [BookStore_BootCamp]    Script Date: 2/7/2022 12:41:56 AM ******/
CREATE DATABASE [BookStore_BootCamp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore_BootCamp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BookStore_BootCamp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_BootCamp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BookStore_BootCamp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookStore_BootCamp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore_BootCamp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore_BootCamp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore_BootCamp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore_BootCamp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore_BootCamp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore_BootCamp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore_BootCamp] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore_BootCamp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore_BootCamp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore_BootCamp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore_BootCamp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore_BootCamp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore_BootCamp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore_BootCamp', N'ON'
GO
ALTER DATABASE [BookStore_BootCamp] SET QUERY_STORE = OFF
GO
USE [BookStore_BootCamp]
GO
/****** Object:  Table [dbo].[tbl_Books]    Script Date: 2/7/2022 12:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Books](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[total_pages] [int] NULL,
	[isbn] [nvarchar](17) NOT NULL,
	[price] [decimal](11, 2) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_tbl_Books] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_active]    Script Date: 2/7/2022 12:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_active]
AS
SELECT active
FROM     dbo.tbl_Books
GO
/****** Object:  Table [dbo].[tbl_Authors]    Script Date: 2/7/2022 12:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Authors](
	[authorID] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_Authors] PRIMARY KEY CLUSTERED 
(
	[authorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bookAuthors]    Script Date: 2/7/2022 12:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bookAuthors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookID] [int] NOT NULL,
	[authorID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_bookAuthors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bookGenres]    Script Date: 2/7/2022 12:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bookGenres](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookID] [int] NOT NULL,
	[genreID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_bookGenres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Genres]    Script Date: 2/7/2022 12:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Genres](
	[genreID] [int] IDENTITY(1,1) NOT NULL,
	[genre] [nvarchar](50) NOT NULL,
	[parentID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Genres] PRIMARY KEY CLUSTERED 
(
	[genreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [SortByPriceAscending]    Script Date: 2/7/2022 12:41:56 AM ******/
CREATE NONCLUSTERED INDEX [SortByPriceAscending] ON [dbo].[tbl_Books]
(
	[price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_bookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bookAuthors_tbl_Authors] FOREIGN KEY([authorID])
REFERENCES [dbo].[tbl_Authors] ([authorID])
GO
ALTER TABLE [dbo].[tbl_bookAuthors] CHECK CONSTRAINT [FK_tbl_bookAuthors_tbl_Authors]
GO
ALTER TABLE [dbo].[tbl_bookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bookAuthors_tbl_Books] FOREIGN KEY([bookID])
REFERENCES [dbo].[tbl_Books] ([bookID])
GO
ALTER TABLE [dbo].[tbl_bookAuthors] CHECK CONSTRAINT [FK_tbl_bookAuthors_tbl_Books]
GO
ALTER TABLE [dbo].[tbl_bookGenres]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bookGenres_tbl_Books] FOREIGN KEY([bookID])
REFERENCES [dbo].[tbl_Books] ([bookID])
GO
ALTER TABLE [dbo].[tbl_bookGenres] CHECK CONSTRAINT [FK_tbl_bookGenres_tbl_Books]
GO
ALTER TABLE [dbo].[tbl_bookGenres]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bookGenres_tbl_Genres] FOREIGN KEY([genreID])
REFERENCES [dbo].[tbl_Genres] ([genreID])
GO
ALTER TABLE [dbo].[tbl_bookGenres] CHECK CONSTRAINT [FK_tbl_bookGenres_tbl_Genres]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_Books"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_active'
GO
USE [master]
GO
ALTER DATABASE [BookStore_BootCamp] SET  READ_WRITE 
GO
