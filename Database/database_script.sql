USE [master]
GO
/****** Object:  Database [DB_Creativity]    Script Date: 17.12.2022 22:29:18 ******/
CREATE DATABASE [DB_Creativity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Creativity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_Creativity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Creativity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_Creativity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_Creativity] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Creativity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Creativity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Creativity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Creativity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Creativity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Creativity] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Creativity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Creativity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Creativity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Creativity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Creativity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Creativity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Creativity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Creativity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Creativity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Creativity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Creativity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Creativity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Creativity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Creativity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Creativity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Creativity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Creativity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Creativity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Creativity] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Creativity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Creativity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Creativity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Creativity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Creativity] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Creativity] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_Creativity] SET QUERY_STORE = OFF
GO
USE [DB_Creativity]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[IdDiscount] [int] IDENTITY(1,1) NOT NULL,
	[Discount] [tinyint] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[IdDiscount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[IdManufacturer] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[IdManufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[IdPickupPoint] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[CodeToGet] [nchar](3) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF50882545] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[IdPickupPoint] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[IdPickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[IdManufacturer] [int] NOT NULL,
	[IdProvider] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[IdDiscount] [int] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[UnitOfMeasurement] [nvarchar](5) NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD521CC1A5D] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[IdProvider] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[IdProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.12.2022 22:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC1B36DE08] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([IdDiscount], [Discount]) VALUES (1, 5)
INSERT [dbo].[Discount] ([IdDiscount], [Discount]) VALUES (2, 10)
INSERT [dbo].[Discount] ([IdDiscount], [Discount]) VALUES (3, 15)
INSERT [dbo].[Discount] ([IdDiscount], [Discount]) VALUES (4, 20)
INSERT [dbo].[Discount] ([IdDiscount], [Discount]) VALUES (5, 25)
INSERT [dbo].[Discount] ([IdDiscount], [Discount]) VALUES (6, 30)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (1, N'АртМир')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (2, N'Волшебная мастерская')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (3, N'ОригамиПлюс')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (4, N'ФлюидАрт')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (1, N'Новый', CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 15, 7, N'931')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (2, N'Новый', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 36, 7, N'932')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (3, N'Новый', CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 18, 9, N'933')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (4, N'Новый', CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 11, 9, N'934')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (5, N'Новый', CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, 9, N'935')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (6, N'Новый', CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 34, 9, N'936')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (7, N'Новый', CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 3, 8, N'937')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (8, N'Новый', CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 20, 8, N'938')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (9, N'Новый', CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 20, 8, N'939')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderDate], [IdPickupPoint], [IdUser], [CodeToGet]) VALUES (10, N'Новый', CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 25, 10, N'940')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'G753H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'N745G4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'S538H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'S735G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'Y354G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'H648T5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'А112Т4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'A385H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'F935G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'S739H7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'V734G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'H745G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'O735F5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'P946G6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'S384G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'A745B6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'A972G5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'C745H6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'K674F4')
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (1, N'344288, г. Чапаевск, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (2, N'614164, г.Чапаевск,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (3, N'394242, г. Чапаевск, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (4, N'660540, г. Чапаевск, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (5, N'125837, г. Чапаевск, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (6, N'125703, г. Чапаевск, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (7, N'625283, г. Чапаевск, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (8, N'614611, г. Чапаевск, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (9, N'454311, г.Чапаевск, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (10, N'660007, г.Чапаевск, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (11, N'603036, г. Чапаевск, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (12, N'450983, г.Чапаевск, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (13, N'394782, г. Чапаевск, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (14, N'603002, г. Чапаевск, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (15, N'450558, г. Чапаевск, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (16, N'394060, г.Чапаевск, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (17, N'410661, г. Чапаевск, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (18, N'625590, г. Чапаевск, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (19, N'625683, г. Чапаевск, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (20, N'400562, г. Чапаевск, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (21, N'614510, г. Чапаевск, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (22, N'410542, г. Чапаевск, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (23, N'620839, г. Чапаевск, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (24, N'443890, г. Чапаевск, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (25, N'603379, г. Чапаевск, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (26, N'603721, г. Чапаевск, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (27, N'410172, г. Чапаевск, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (28, N'420151, г. Чапаевск, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (29, N'125061, г. Чапаевск, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (30, N'630370, г. Чапаевск, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (31, N'614753, г. Чапаевск, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (32, N'426030, г. Чапаевск, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (33, N'450375, г. Чапаевск ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (34, N'625560, г. Чапаевск, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (35, N'630201, г. Чапаевск, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([IdPickupPoint], [Address]) VALUES (36, N'190949, г. Чапаевск, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'A385H6', N'набор для рисования', N'Набор для рисования и творчества детский игровой', N'Рисование', N'', 1, 3, CAST(176.0000 AS Decimal(19, 4)), 2, 15, N'шт.', N' Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'A745B6', N'Творческий набор', N'Волшебная Мастерская Мозаика из пайеток на холсте Бабочка', N'Творчество', N'', 4, 2, CAST(129.0000 AS Decimal(19, 4)), 2, 7, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'A972G5', N'Набор для рисования', N'BONDIBON Набор для творчества Аквамозаика 3D Медведь', N'Творчество', N'', 2, 2, CAST(1567.0000 AS Decimal(19, 4)), 3, 3, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'C745H6', N'Набор для рисования', N'Набор для рисования и творчества', N'Рисование', N'Database/Images/Товар_import/C745H6.png', 3, 1, CAST(999.0000 AS Decimal(19, 4)), 3, 4, N'шт.', N' Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'D845G5', N'Набор для рисования', N'Буква- ленд / Набор для творчества / Развивающий набор', N'Рисование', N'', 3, 2, CAST(311.0000 AS Decimal(19, 4)), 3, 5, N'шт.', N' Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'F935G5', N'Творческий набор', N'Origami Набор для детского творчества Оригами Братья наши меньшие', N'Творчество', N'', 1, 3, CAST(2467.0000 AS Decimal(19, 4)), 3, 24, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'G735G6', N'Набор для рисования', N'Набор для рисования и творчества, 176 предметов, с мольбертом, розовый', N'Рисование', N'Database/Images/Товар_import/G735G6.png', 2, 2, CAST(1400.0000 AS Decimal(19, 4)), 4, 8, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'G753H6', N'Набор для рисования', N'Набор для рисования и творчества, 145 предметов, розовый', N'Рисование', N'Database/Images/Товар_import/G753H6.png', 3, 2, CAST(1999.0000 AS Decimal(19, 4)), 5, 4, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'H648T5', N'Набор для рисования', N'Набор для рисования и творчества в чемоданчике с мольбертом', N'Рисование', N'Database/Images/Товар_import/H648T5.jpg', 2, 2, CAST(849.0000 AS Decimal(19, 4)), 4, 12, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'H745G5', N'Творческий набор', N'Набор для детского творчества "Умный песок" Кексики', N'Творчество', N'Database/Images/Товар_import/H745G5.jpg', 4, 2, CAST(645.0000 AS Decimal(19, 4)), 5, 15, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'K674F4', N'Творческий набор', N'Aquabeads Аквамозаика Студия новичка с формой-перевертышем', N'Творчество', N'Database/Images/Товар_import/K674F4.jpg', 1, 3, CAST(1170.0000 AS Decimal(19, 4)), 4, 2, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'K946G6', N'Набор для рисования', N'Волшебная Мастерская Набор для творчества Незабудка', N'Рисование', N'', 2, 2, CAST(784.0000 AS Decimal(19, 4)), 4, 5, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'L845G5', N'Творческий набор', N'GHK Набор для творчества "Гравюра 20 x 25.5 см №10 "Пушистый котенок"', N'Творчество', N'', 1, 3, CAST(1456.0000 AS Decimal(19, 4)), 2, 4, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'L946G6', N'Набор для рисования', N'Набор для раскрашивания панно многослойное CRAFT MASTER', N'Рисование', N'', 2, 2, CAST(1827.0000 AS Decimal(19, 4)), 3, 9, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'N446G5', N'набор для рисования', N'GHK Набор для творчества "Гравюра 20 x 25.5 см №16 "Москва" ', N'Рисование', N'', 1, 3, CAST(643.0000 AS Decimal(19, 4)), 4, 26, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'N745G4', N'Творческий набор', N'Molly набор для творчества Флюид Арт Планета Земля', N'Творчество', N'Database/Images/Товар_import/N745G4.jpg', 2, 2, CAST(1000.0000 AS Decimal(19, 4)), 2, 6, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'O735F5', N'набор для рисования', N'Я-Художник! / Набор для рисования из 10 предметов', N'Рисование', N'Database/Images/Товар_import/O735F5.jpg', 1, 3, CAST(1300.0000 AS Decimal(19, 4)), 3, 5, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'P946G6', N'Набор для рисования', N'Набор для творчества Луч Витраж светящийся', N'Рисование', N'', 3, 2, CAST(2300.0000 AS Decimal(19, 4)), 4, 3, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'S384G5', N'Творческий набор', N'Набор для творчества Canal Toys ART LAB для создания картин', N'Творчество', N'', 2, 2, CAST(543.0000 AS Decimal(19, 4)), 5, 5, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'S538H6', N'Творческий набор', N'Набор для творчества "Магический песок - создай гребешок" 8 цветов', N'Творчество', N'', 2, 2, CAST(543.0000 AS Decimal(19, 4)), 3, 4, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'S735G5', N'Набор для рисования', N'Набор для творчества Фонарик Новогодняя ночь', N'Рисование', N'', 3, 1, CAST(233.0000 AS Decimal(19, 4)), 4, 5, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'S739H7', N'Творческий набор', N'BONDIBON Набор для творчества Копилка-подарок Миша', N'Творчество', N'', 4, 2, CAST(268.0000 AS Decimal(19, 4)), 4, 12, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'V734G5', N'Набор для рисования', N'BONDIBON Набор для творчества Шьем для любимой куклы ', N'Рисование', N'', 3, 1, CAST(754.0000 AS Decimal(19, 4)), 5, 5, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'V745G5', N'Творческий набор', N'BONDIBON Набор для творчества Аквамозаика 3D Слон', N'Творчество', N'', 1, 1, CAST(1678.0000 AS Decimal(19, 4)), 5, 8, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'V834G6', N'Набор для рисования', N'ГАММА Набор юного художника Классический в подарочной коробке', N'Рисование', N'', 2, 2, CAST(1267.0000 AS Decimal(19, 4)), 3, 9, N'шт.', N'Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'V946G5', N'Творческий набор', N'Набор для творчества Рыжий кот Холст с красками по номерам', N'Творчество', N'', 1, 1, CAST(245.0000 AS Decimal(19, 4)), 3, 7, N'шт.', N' Нет на складе')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'X485G6', N'Творческий набор', N'GHK Набор для творчества "Гравюра 20 x 25.5 см №15 "Игривый котенок" (золото)', N'Творчество', N'', 1, 1, CAST(241.0000 AS Decimal(19, 4)), 5, 5, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'X745H6', N'Творческий набор', N'Волшебная Мастерская Мозаика из пайеток 3D "Слон" 3D-06', N'Творчество', N'', 1, 1, CAST(1500.0000 AS Decimal(19, 4)), 2, 23, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'Y354G6', N'Творческий набор', N'Origami Набор для творчества оригами На земле, на воде, на воздухе', N'Творчество', N'Database/Images/Товар_import/Y354G6.jpg', 1, 1, CAST(200.0000 AS Decimal(19, 4)), 3, 8, N'шт.', N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [IdManufacturer], [IdProvider], [ProductCost], [IdDiscount], [ProductQuantityInStock], [UnitOfMeasurement], [ProductStatus]) VALUES (N'А112Т4', N'Творческий набор', N'Творческий набор юного художника для рисования', N'Творчество', N'Database/Images/Товар_import/А112Т4.jpg', 1, 1, CAST(889.0000 AS Decimal(19, 4)), 2, 6, N'шт.', N' Нет на складе')
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([IdProvider], [Provider]) VALUES (1, N'Леонардо')
INSERT [dbo].[Provider] ([IdProvider], [Provider]) VALUES (2, N'Буквоед')
INSERT [dbo].[Provider] ([IdProvider], [Provider]) VALUES (3, N'АртКвартал')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Соловьев', N'Тимофей', N'Маркович', N'', N'', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Савельева', N'Майя', N'Михайловна', N's8w0btpz94o7@gmail.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Назаров', N'Андрей', N'Никитич', N'lq6tsbvy5gue@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Кулешов', N'Леонид', N'Андреевич', N'hzks9681fmgc@outlook.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Попов', N'Игорь', N'Александрович', N'khg8y7dsqim2@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Петров', N'Тимур', N'Сергеевич', N'0wxz32c9hgsb@tutanota.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Севастьянова', N'София', N'Савельевна', N'340quyv18aoi@yahoo.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Рыбакова', N'Ярослава', N'Глебовна', N'7jwstxrhqd85@outlook.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Петрова', N'Лейла', N'Артёмовна', N'0tsyif3h85ca@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Щербаков', N'Александр', N'Александрович', N'gs3wm0d9lcx1@outlook.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([IdPickupPoint])
REFERENCES [dbo].[PickupPoint] ([IdPickupPoint])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount] FOREIGN KEY([IdDiscount])
REFERENCES [dbo].[Discount] ([IdDiscount])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Discount]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[Manufacturer] ([IdManufacturer])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([IdProvider])
REFERENCES [dbo].[Provider] ([IdProvider])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_ProductCost] CHECK  (([ProductCost]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_ProductCost]
GO
USE [master]
GO
ALTER DATABASE [DB_Creativity] SET  READ_WRITE 
GO
