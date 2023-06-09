USE [master]
GO
/****** Object:  Database [bmweb]    Script Date: 5/25/2023 1:41:24 PM ******/
CREATE DATABASE [bmweb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bmweb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bmweb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bmweb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bmweb_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bmweb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bmweb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bmweb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bmweb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bmweb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bmweb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bmweb] SET ARITHABORT OFF 
GO
ALTER DATABASE [bmweb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bmweb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bmweb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bmweb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bmweb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bmweb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bmweb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bmweb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bmweb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bmweb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bmweb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bmweb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bmweb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bmweb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bmweb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bmweb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bmweb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bmweb] SET RECOVERY FULL 
GO
ALTER DATABASE [bmweb] SET  MULTI_USER 
GO
ALTER DATABASE [bmweb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bmweb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bmweb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bmweb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bmweb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bmweb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bmweb', N'ON'
GO
ALTER DATABASE [bmweb] SET QUERY_STORE = OFF
GO
USE [bmweb]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[cartId] [bigint] NULL,
	[productId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[image] [varchar](255) NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](32) NOT NULL,
	[slug] [nvarchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_foei036ov74bv692o5lh5oi66] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commission](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cost] [float] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[description] [varchar](3000) NOT NULL,
	[isDeleted] [bit] NULL,
	[name] [varchar](32) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_cthaeyihb427j99g0plrgnjac] UNIQUE NONCLUSTERED 
(
	[cost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_i89318ys48agaxg66rapbmwjd] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[description] [nvarchar](1000) NOT NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [int] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_gtijw1lyfmya1htq1710oyije] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[orderId] [bigint] NOT NULL,
	[productId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[amountFromStore] [float] NOT NULL,
	[amountFromUser] [float] NOT NULL,
	[amountToGD] [float] NOT NULL,
	[amountToStore] [float] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isPaidBefore] [bit] NULL,
	[phone] [varchar](255) NOT NULL,
	[status] [nvarchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
	[commissionId] [bigint] NULL,
	[deliveryId] [bigint] NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[description] [nvarchar](1000) NOT NULL,
	[isActive] [bit] NULL,
	[isSelling] [bit] NULL,
	[listImages] [varbinary](255) NULL,
	[name] [nvarchar](1000) NOT NULL,
	[price] [float] NOT NULL,
	[promotionalPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[slug] [varchar](255) NULL,
	[sold] [int] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[categoryId] [bigint] NULL,
	[storeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[createdAt] [datetime2](7) NULL,
	[stars] [int] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[orderId] [bigint] NULL,
	[productId] [bigint] NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreLevel]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreLevel](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[discount] [float] NOT NULL,
	[isDeleted] [bit] NULL,
	[minPoint] [int] NOT NULL,
	[name] [varchar](32) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_3e3gajsmc1pah99g156l3jx38] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ihxdb02km9mk7hrijtkwohy0s] UNIQUE NONCLUSTERED 
(
	[minPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[avatar] [varchar](255) NULL,
	[bio] [nvarchar](1000) NOT NULL,
	[cover] [varchar](255) NULL,
	[createdAt] [datetime2](7) NULL,
	[eWallet] [float] NOT NULL,
	[featuredImages] [varbinary](255) NULL,
	[isActive] [bit] NULL,
	[isOpen] [bit] NULL,
	[name] [nvarchar](100) NOT NULL,
	[point] [int] NOT NULL,
	[rating] [varbinary](255) NULL,
	[slug] [varchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
	[commissionId] [bigint] NULL,
	[ownerId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_q9aiko1f4vw1cywu2qx1r0lxe] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Style]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Style](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](255) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[categoryId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_1l0fqi6vl42m31m1v1kbsnb51] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StyleValue]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StyleValue](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
	[name] [nvarchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
	[styleId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[isUp] [bit] NOT NULL,
	[updatedAt] [datetime2](7) NULL,
	[storeId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFollowProduct]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFollowProduct](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[productId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFollowStore]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFollowStore](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[storeId] [bigint] NULL,
	[userId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLevel]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLevel](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[discount] [float] NOT NULL,
	[isDeleted] [bit] NULL,
	[minPoint] [int] NOT NULL,
	[name] [varchar](32) NOT NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_jnfgq0hj9mbrdv9mvs1ury78o] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_py9kne8862oj4vhwecwuhwl30] UNIQUE NONCLUSTERED 
(
	[minPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/25/2023 1:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[_id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[avatar] [varchar](255) NULL,
	[cover] [varchar](255) NULL,
	[createdAt] [datetime2](7) NULL,
	[eWallet] [float] NULL,
	[email] [varchar](255) NULL,
	[firstName] [varchar](32) NOT NULL,
	[hashedPassword] [varchar](255) NOT NULL,
	[idCard] [varchar](255) NULL,
	[isEmailActive] [bit] NOT NULL,
	[isPhoneActive] [bit] NOT NULL,
	[lastName] [varchar](32) NOT NULL,
	[phone] [varchar](255) NULL,
	[point] [int] NULL,
	[roles] [varchar](255) NULL,
	[salt] [varchar](255) NULL,
	[slug] [varchar](255) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_e8pwwyd4x0tdcvbeust6x0pyg] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ncoa9bfasrql0x4nhmh1plxxy] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_r8xtu21qxmruqe6xxmr0ynvuo] UNIQUE NONCLUSTERED 
(
	[idCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK56jhamibyhrwmqq83d8dvkk8i] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK56jhamibyhrwmqq83d8dvkk8i]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK8badkl4hyi91r30iy5pdllj2c] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK8badkl4hyi91r30iy5pdllj2c]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK1ddqmbytuin6giodgt7m8ele5] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([_id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK1ddqmbytuin6giodgt7m8ele5]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FKfm2xpv0aksxnpoucoywb41f86] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FKfm2xpv0aksxnpoucoywb41f86]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK12pimxsfi75oqfugkd53la3pb] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([_id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK12pimxsfi75oqfugkd53la3pb]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FKl8avcrunmvqdcldoec2duhdiq] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FKl8avcrunmvqdcldoec2duhdiq]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK3l71r543jmgg0gcf6c240i2ig] FOREIGN KEY([commissionId])
REFERENCES [dbo].[Commission] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK3l71r543jmgg0gcf6c240i2ig]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK8irfi0mrlch2uaghfn35b3psj] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK8irfi0mrlch2uaghfn35b3psj]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKhpcu7jevrf0dmnte1pyyy8xrk] FOREIGN KEY([deliveryId])
REFERENCES [dbo].[Delivery] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKhpcu7jevrf0dmnte1pyyy8xrk]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKipog0as9ckoo6qf2t0lwk3mbe] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKipog0as9ckoo6qf2t0lwk3mbe]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK42iy97xlo64j31dslbn36vmyh] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK42iy97xlo64j31dslbn36vmyh]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK6s1lvcwo8aidbq7e2bvkifcl8] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK6s1lvcwo8aidbq7e2bvkifcl8]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKd756nyvyqf682gjmye8x0dmgm] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKd756nyvyqf682gjmye8x0dmgm]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKj40p2rl0ign9b1sqw17hha5hr] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKj40p2rl0ign9b1sqw17hha5hr]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKodt7pvbpf8jfwykxvrviqwdxm] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKodt7pvbpf8jfwykxvrviqwdxm]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKsw4540dpplaoc7wlvnc5lgtih] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKsw4540dpplaoc7wlvnc5lgtih]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FKevj60nt2yks07jfyy1753suwc] FOREIGN KEY([ownerId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FKevj60nt2yks07jfyy1753suwc]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FKn5c3ae92y2nltohgdmkf5f2dl] FOREIGN KEY([commissionId])
REFERENCES [dbo].[Commission] ([_id])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FKn5c3ae92y2nltohgdmkf5f2dl]
GO
ALTER TABLE [dbo].[Style]  WITH CHECK ADD  CONSTRAINT [FKodtqqd8l7wxie8o2nrla3wq4x] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([_id])
GO
ALTER TABLE [dbo].[Style] CHECK CONSTRAINT [FKodtqqd8l7wxie8o2nrla3wq4x]
GO
ALTER TABLE [dbo].[StyleValue]  WITH CHECK ADD  CONSTRAINT [FKtoebbw96g906jruek55xcr7q5] FOREIGN KEY([styleId])
REFERENCES [dbo].[Style] ([_id])
GO
ALTER TABLE [dbo].[StyleValue] CHECK CONSTRAINT [FKtoebbw96g906jruek55xcr7q5]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FKf21aa058kessk3psypjm7fmuq] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FKf21aa058kessk3psypjm7fmuq]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FKi0rmqsu2c60q6i0ulfj31b2qd] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FKi0rmqsu2c60q6i0ulfj31b2qd]
GO
ALTER TABLE [dbo].[UserFollowProduct]  WITH CHECK ADD  CONSTRAINT [FKcs97uyao2yl9almoojiy7glan] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[UserFollowProduct] CHECK CONSTRAINT [FKcs97uyao2yl9almoojiy7glan]
GO
ALTER TABLE [dbo].[UserFollowProduct]  WITH CHECK ADD  CONSTRAINT [FKjjlvwg6euk1c7hk5i2upp81ey] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([_id])
GO
ALTER TABLE [dbo].[UserFollowProduct] CHECK CONSTRAINT [FKjjlvwg6euk1c7hk5i2upp81ey]
GO
ALTER TABLE [dbo].[UserFollowStore]  WITH CHECK ADD  CONSTRAINT [FK16s7oooj6fk69shedixjegf38] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([_id])
GO
ALTER TABLE [dbo].[UserFollowStore] CHECK CONSTRAINT [FK16s7oooj6fk69shedixjegf38]
GO
ALTER TABLE [dbo].[UserFollowStore]  WITH CHECK ADD  CONSTRAINT [FKhpqnnquu8hrjah6mwlb1vvjxs] FOREIGN KEY([storeId])
REFERENCES [dbo].[Stores] ([_id])
GO
ALTER TABLE [dbo].[UserFollowStore] CHECK CONSTRAINT [FKhpqnnquu8hrjah6mwlb1vvjxs]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD CHECK  (([count]>=(1)))
GO
ALTER TABLE [dbo].[Commission]  WITH CHECK ADD CHECK  (([cost]>=(0)))
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD CHECK  (([count]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountFromStore]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountFromUser]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountToGD]>=(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([amountToStore]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([promotionalPrice]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([sold]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [bmweb] SET  READ_WRITE 
GO
