USE [master]
GO
/****** Object:  Database [Prisao1]    Script Date: 02/01/2024 17:38:09 ******/
CREATE DATABASE [Prisao1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prisao1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\Prisao1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prisao1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\Prisao1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Prisao1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prisao1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prisao1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prisao1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prisao1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prisao1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prisao1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prisao1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prisao1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prisao1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prisao1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prisao1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prisao1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prisao1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prisao1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prisao1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prisao1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prisao1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prisao1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prisao1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prisao1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prisao1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prisao1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prisao1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prisao1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prisao1] SET  MULTI_USER 
GO
ALTER DATABASE [Prisao1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prisao1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prisao1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prisao1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prisao1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prisao1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Prisao1] SET QUERY_STORE = ON
GO
ALTER DATABASE [Prisao1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Prisao1]
GO
/****** Object:  Table [dbo].[Cela]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cela](
	[id_cela] [int] IDENTITY(1,1) NOT NULL,
	[capacidade] [int] NOT NULL,
	[localização] [char](1) NOT NULL,
	[ocupação] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crime]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crime](
	[id_crime] [int] IDENTITY(1,1) NOT NULL,
	[nome_crime] [varchar](15) NOT NULL,
	[Crime_violento] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_crime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recluso]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recluso](
	[id_recluso] [int] IDENTITY(1,1) NOT NULL,
	[codigo_postal] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[nif] [int] NOT NULL,
	[Pena] [int] NOT NULL,
	[data_nascimento] [date] NOT NULL,
	[data_entrada] [date] NOT NULL,
	[data_saida] [date] NOT NULL,
	[nacionalidade] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_recluso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cela_recluso]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cela_recluso](
	[id_recluso] [int] NOT NULL,
	[id_cela] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cela] ASC,
	[id_recluso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crime_recluso]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crime_recluso](
	[id_recluso] [int] NOT NULL,
	[id_crime] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_crime] ASC,
	[id_recluso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ListaRCL]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListaRCL] AS
SELECT
    R.nome AS nome_prisioneiro,
    CASE
        WHEN MAX(C.Crime_violento * 1) = 1 THEN 'Violento'
        ELSE 'Não Violento'
    END AS status_violento,
    CR.id_cela,
    CE.localização AS bloco_cela
FROM
    Recluso R
JOIN
    Cela_recluso CR ON R.id_recluso = CR.id_recluso
JOIN
    Cela CE ON CR.id_cela = CE.id_cela
LEFT JOIN
    Crime_recluso CRC ON R.id_recluso = CRC.id_recluso
LEFT JOIN
    Crime C ON CRC.id_crime = C.id_crime
GROUP BY
    R.id_recluso, R.nome, CR.id_cela, CE.localização

GO
/****** Object:  Table [dbo].[Visita_medica]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visita_medica](
	[id_recluso] [int] NOT NULL,
	[id_visita_medica] [int] IDENTITY(1,1) NOT NULL,
	[data_consulta] [date] NOT NULL,
	[hora_consulta] [time](7) NOT NULL,
	[motivo] [varchar](30) NOT NULL,
	[diagnostico] [varchar](30) NOT NULL,
	[prescrição] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_visita_medica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HistoricoDeTodasConsultas]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HistoricoDeTodasConsultas] AS
SELECT
	R.id_recluso,
    R.nome AS nome_recluso,
    VM.id_visita_medica,
    VM.data_consulta,
    CONVERT(VARCHAR(5), VM.hora_consulta, 108) AS hora_consulta_formatada,
    VM.motivo,
    VM.diagnostico,
    VM.prescrição
FROM
    Visita_medica VM
JOIN
    Recluso R ON VM.id_recluso = R.id_recluso

GO
/****** Object:  Table [dbo].[Programa_de_reabilitaçao]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa_de_reabilitaçao](
	[id_programa] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[coordenador] [varchar](100) NOT NULL,
	[descriçao] [varchar](200) NOT NULL,
	[data_inicio] [date] NOT NULL,
	[data_fim] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_programa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recluso_inscritos]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recluso_inscritos](
	[id_recluso] [int] NOT NULL,
	[id_programa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_recluso] ASC,
	[id_programa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DetalhesReclusos]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetalhesReclusos] AS
SELECT
    R.id_recluso,
    R.nome,
    R.codigo_postal,
    R.nif,
    CONCAT(R.Pena, ' anos') AS Pena_formatada,
    C.id_cela,
    C.localização AS localizacao_cela,
    R.data_nascimento,
    R.data_entrada,
    R.data_saida,
    R.nacionalidade,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM Crime_recluso CR
            INNER JOIN Crime C ON CR.id_crime = C.id_crime
            WHERE CR.id_recluso = R.id_recluso AND C.Crime_violento = 1
        ) THEN 'Violento'
        ELSE 'Não Violento'
    END AS status_violento,
    COALESCE(
        (
            SELECT P.nome
            FROM Recluso_inscritos RI
            INNER JOIN Programa_de_reabilitaçao P ON RI.id_programa = P.id_programa
            WHERE RI.id_recluso = R.id_recluso
        ),
        'Nenhuma'
    ) AS programa_reabilitacao,
    CONCAT(
        CASE WHEN DATEDIFF(MONTH, GETDATE(), R.data_saida) > 0
             THEN CONVERT(VARCHAR, DATEDIFF(MONTH, GETDATE(), R.data_saida)) + ' meses ' ELSE '' END,
        CONVERT(VARCHAR, ABS(DATEDIFF(DAY, DATEADD(MONTH, DATEDIFF(MONTH, 0, R.data_saida), 0), R.data_saida))) + ' dias'
    ) AS tempo_restante
FROM
    Recluso R
LEFT JOIN
    Cela_recluso CR ON R.id_recluso = CR.id_recluso
LEFT JOIN
    Cela C ON CR.id_cela = C.id_cela;

GO
/****** Object:  View [dbo].[NViolentos]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NViolentos]
AS
SELECT DISTINCT nome, ' Não Violento' AS indicador
FROM     dbo.Recluso
WHERE  (id_recluso NOT IN
                      (SELECT R.id_recluso
                       FROM      dbo.Recluso AS R INNER JOIN
                                         dbo.Crime_recluso AS CR ON R.id_recluso = CR.id_recluso INNER JOIN
                                         dbo.Crime AS C ON CR.id_crime = C.id_crime
                       WHERE   (C.Crime_violento = 1)))
GO
/****** Object:  View [dbo].[Violentos]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Violentos] AS
SELECT DISTINCT Recluso.nome, ' Violento' AS indicador
FROM Recluso
JOIN Crime_recluso ON Recluso.id_recluso = Crime_recluso.id_recluso
JOIN Crime ON Crime_recluso.id_crime = Crime.id_crime
WHERE Crime.Crime_violento = 1;

GO
/****** Object:  View [dbo].[ListaDeProgramas]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListaDeProgramas] AS
SELECT
    PR.nome AS nome_plano_reabilitacao,
    PR.coordenador AS docente,
    PR.descriçao AS descricao
FROM
    Programa_de_reabilitaçao PR;

GO
/****** Object:  Table [dbo].[Atividade]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atividade](
	[id_atividade] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[descriçao] [varchar](200) NOT NULL,
	[hora_atividade] [time](7) NOT NULL,
	[docente] [varchar](100) NOT NULL,
	[data_atividade] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_atividade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ListaDeAtividades]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListaDeAtividades] AS
SELECT
    A.nome AS nome_atividade,
    A.docente,
    A.descriçao AS descricao
FROM
    Atividade A
GROUP BY
    A.nome, A.docente, A.descriçao;

GO
/****** Object:  Table [dbo].[Atividade_reabilitaçao]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atividade_reabilitaçao](
	[id_programa] [int] NOT NULL,
	[id_atividade] [int] NOT NULL,
	[id_recluso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_programa] ASC,
	[id_atividade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Morada]    Script Date: 02/01/2024 17:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Morada](
	[codigo_postal] [int] NOT NULL,
	[morada] [varchar](50) NOT NULL,
	[Cidade] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_postal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Atividade] ON 

INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (1, N'Educação Financeira', N'Palestra sobre gestão de finanças pessoais', CAST(N'14:00:00' AS Time), N'Dr. Jorge Santos', CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (2, N'Oficina de Artesanato', N'Produção de artesanato com materiais recicláveis', CAST(N'10:30:00' AS Time), N'Dra. Sandra Correia', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (3, N'Aula de Literatura', N'Discussão de obras literárias clássicas', CAST(N'16:00:00' AS Time), N'Dr. Pedro Santiago', CAST(N'2023-11-10' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (4, N'Aula de Educação Física', N'Atividades físicas e desportivas', CAST(N'09:00:00' AS Time), N'Dra. Inês Ferreira', CAST(N'2022-11-05' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (5, N'Curso de Informática', N'Noções básicas de informática', CAST(N'13:30:00' AS Time), N'Dr. Artur Cabral', CAST(N'2023-05-20' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (6, N'Curso de Linguas', N'Aulas de inglês e espanhol', CAST(N'16:30:00' AS Time), N'Dra. Sandra Correia', CAST(N'2023-10-05' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (7, N'Educação Financeira', N'Palestra sobre gestão de finanças pessoais', CAST(N'14:00:00' AS Time), N'Dr. Jorge Santos', CAST(N'2023-04-01' AS Date))
INSERT [dbo].[Atividade] ([id_atividade], [nome], [descriçao], [hora_atividade], [docente], [data_atividade]) VALUES (8, N'Oficina de Artesanato', N'Produção de artesanato com materiais recicláveis', CAST(N'10:30:00' AS Time), N'Dra. Sandra Correia', CAST(N'2023-04-08' AS Date))
SET IDENTITY_INSERT [dbo].[Atividade] OFF
GO
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (27, 1, 1)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (27, 5, 5)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (28, 1, 9)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (28, 2, 2)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (28, 5, 10)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (28, 6, 6)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (29, 3, 3)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (29, 7, 7)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (30, 4, 4)
INSERT [dbo].[Atividade_reabilitaçao] ([id_programa], [id_atividade], [id_recluso]) VALUES (30, 8, 8)
GO
SET IDENTITY_INSERT [dbo].[Cela] ON 

INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (1, 4, N'A', 3)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (2, 4, N'A', 3)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (3, 4, N'A', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (4, 4, N'A', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (5, 4, N'A', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (6, 2, N'B', 2)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (7, 2, N'B', 1)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (8, 2, N'B', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (9, 2, N'B', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (10, 2, N'B', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (11, 2, N'B', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (12, 1, N'C', 1)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (13, 1, N'C', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (14, 1, N'C', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (15, 1, N'C', 0)
INSERT [dbo].[Cela] ([id_cela], [capacidade], [localização], [ocupação]) VALUES (16, 1, N'C', 0)
SET IDENTITY_INSERT [dbo].[Cela] OFF
GO
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (1, 1)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (3, 1)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (4, 2)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (5, 2)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (6, 2)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (10, 2)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (7, 6)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (8, 6)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (9, 7)
INSERT [dbo].[Cela_recluso] ([id_recluso], [id_cela]) VALUES (2, 12)
GO
SET IDENTITY_INSERT [dbo].[Crime] ON 

INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (47, N'Roubo', 1)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (48, N'Furto', 0)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (49, N'Homicídio', 1)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (50, N'Fraude', 0)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (51, N'Assalto', 1)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (52, N'Tráfico Drogas', 0)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (53, N'Hacking', 0)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (54, N'Agressão', 1)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (55, N'Corrupção', 0)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (56, N'Lavagem capital', 0)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (57, N'Sequestro', 1)
INSERT [dbo].[Crime] ([id_crime], [nome_crime], [Crime_violento]) VALUES (58, N'Vandalismo', 0)
SET IDENTITY_INSERT [dbo].[Crime] OFF
GO
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (1, 47)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (2, 48)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (3, 49)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (4, 50)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (5, 51)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (6, 52)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (7, 53)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (8, 54)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (9, 55)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (10, 56)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (2, 57)
INSERT [dbo].[Crime_recluso] ([id_recluso], [id_crime]) VALUES (1, 58)
GO
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (1349040, N'Rua Andrade Couto, 36', N'Lisboa')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (1500002, N'Rua Camilo Castelo Branco, 19', N'Lisboa')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (2400446, N'Tv. do Largo, 64', N'Leiria')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (3030175, N'Rua do Brasil, 305', N'Coimbra')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (3030194, N'Rua José Maria do Santos, 19', N'Coimbra')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (3810164, N'Rua de São Martinho, 48', N'Aveiro')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (4400107, N'Rua Miguel Torga, 104', N'Porto')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (4405900, N'Rua Diogo Couto, 77', N'Porto')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (5300207, N'Rua de Angola, 12', N'Bragança')
INSERT [dbo].[Morada] ([codigo_postal], [morada], [Cidade]) VALUES (7800477, N'Rua António Sardinha, 25', N'Beja')
GO
SET IDENTITY_INSERT [dbo].[Programa_de_reabilitaçao] ON 

INSERT [dbo].[Programa_de_reabilitaçao] ([id_programa], [nome], [coordenador], [descriçao], [data_inicio], [data_fim]) VALUES (27, N'Reinserção Social', N'Dr. Jorge Santos', N'Oferece uma nova perspectiva através da educação', CAST(N'2023-03-01' AS Date), CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Programa_de_reabilitaçao] ([id_programa], [nome], [coordenador], [descriçao], [data_inicio], [data_fim]) VALUES (28, N'Resgate pela Educação', N'Dra. Sandra Correia', N'Um programa que busca resgatar vidas por meio da educação.', CAST(N'2023-04-01' AS Date), CAST(N'2023-10-31' AS Date))
INSERT [dbo].[Programa_de_reabilitaçao] ([id_programa], [nome], [coordenador], [descriçao], [data_inicio], [data_fim]) VALUES (29, N'Segunda Oportunidade', N'Dr. Pedro Santiago', N'Um programa para ajudar na reinserção de indivíduos no convívio social.', CAST(N'2023-04-01' AS Date), CAST(N'2023-10-31' AS Date))
INSERT [dbo].[Programa_de_reabilitaçao] ([id_programa], [nome], [coordenador], [descriçao], [data_inicio], [data_fim]) VALUES (30, N'Programa de Educação e Trabalho', N'Dr. Artur Cabral', N' Integração de aprendizado e ocupação laboral, visando preparar prisioneiros para uma transição bem-sucedida para a vida pós-prisão.', CAST(N'2023-03-01' AS Date), CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Programa_de_reabilitaçao] ([id_programa], [nome], [coordenador], [descriçao], [data_inicio], [data_fim]) VALUES (31, N'Renovação Prisional', N'Dra. Inês Ferreira', N'Focado na transformação pessoal, esse programa busca inspirar a mudança de comportamento e valores para uma reintegração mais positiva na comunidade.', CAST(N'2023-04-01' AS Date), CAST(N'2023-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[Programa_de_reabilitaçao] OFF
GO
SET IDENTITY_INSERT [dbo].[Recluso] ON 

INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (1, 4400107, N'Paulo Campos', 270231064, 9, CAST(N'1997-08-25' AS Date), CAST(N'2015-05-02' AS Date), CAST(N'2024-05-02' AS Date), N'Portuguesa')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (2, 1349040, N'Ricardo Ribeiro', 293860572, 25, CAST(N'1940-05-05' AS Date), CAST(N'2000-03-01' AS Date), CAST(N'2025-03-01' AS Date), N'Portuguesa')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (3, 4405900, N'Pedro Saraiva', 211573590, 5, CAST(N'1990-01-01' AS Date), CAST(N'2020-01-20' AS Date), CAST(N'2025-01-20' AS Date), N'Portuguesa')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (4, 3030194, N'David Santos', 250487578, 1, CAST(N'1985-05-05' AS Date), CAST(N'2023-07-03' AS Date), CAST(N'2024-07-03' AS Date), N'Portuguesa')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (5, 7800477, N'Helder Valente', 212072897, 12, CAST(N'1990-01-01' AS Date), CAST(N'2013-04-06' AS Date), CAST(N'2025-04-06' AS Date), N'Brasileira')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (6, 2400446, N'João Azevedo', 207340625, 5, CAST(N'1985-05-05' AS Date), CAST(N'2022-02-02' AS Date), CAST(N'2027-02-02' AS Date), N'Espanhola')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (7, 3030175, N'Rafael Santos', 229480160, 4, CAST(N'1990-01-01' AS Date), CAST(N'2020-12-31' AS Date), CAST(N'2024-12-31' AS Date), N'Portuguesa')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (8, 5300207, N'Rui Pinto', 282422099, 8, CAST(N'1985-05-05' AS Date), CAST(N'2017-04-25' AS Date), CAST(N'2025-04-25' AS Date), N'Brasileira')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (9, 3810164, N'Alcides Mendes', 280086997, 2, CAST(N'1990-01-01' AS Date), CAST(N'2022-11-26' AS Date), CAST(N'2024-11-26' AS Date), N'Portuguesa')
INSERT [dbo].[Recluso] ([id_recluso], [codigo_postal], [nome], [nif], [Pena], [data_nascimento], [data_entrada], [data_saida], [nacionalidade]) VALUES (10, 1500002, N'Cristiano Ronaldo', 243359217, 3, CAST(N'1985-05-05' AS Date), CAST(N'2022-05-14' AS Date), CAST(N'2025-05-14' AS Date), N'Portuguesa')
SET IDENTITY_INSERT [dbo].[Recluso] OFF
GO
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (1, 27)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (2, 28)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (3, 29)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (4, 30)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (5, 27)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (6, 28)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (7, 29)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (8, 30)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (9, 28)
INSERT [dbo].[Recluso_inscritos] ([id_recluso], [id_programa]) VALUES (10, 28)
GO
SET IDENTITY_INSERT [dbo].[Visita_medica] ON 

INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (1, 1, CAST(N'2023-07-11' AS Date), CAST(N'11:00:00' AS Time), N'Consulta de rotina', N'Saudável', N'Nenhuma')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (2, 2, CAST(N'2022-11-15' AS Date), CAST(N'14:00:00' AS Time), N'Dor de cabeça', N'Sem problemas graves', N'Analgésicos')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (2, 3, CAST(N'2021-03-07' AS Date), CAST(N'10:00:00' AS Time), N'Dor de dentes', N'Problema grave', N'Remoção de 2 dentes')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (2, 4, CAST(N'2023-12-29' AS Date), CAST(N'17:00:00' AS Time), N'Dor no ouvido direito', N'Problema grave', N'Gotas auriculares')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (2, 5, CAST(N'2019-02-01' AS Date), CAST(N'12:00:00' AS Time), N'Consulta de rotina', N'Saudável', N'Nenhuma')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (5, 6, CAST(N'2022-08-10' AS Date), CAST(N'18:00:00' AS Time), N'Dor de dentes', N'Sem problemas graves', N'Analgésicos')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (6, 7, CAST(N'2023-10-03' AS Date), CAST(N'15:00:00' AS Time), N'Consulta de rotina', N'Saudável', N'Nenhuma')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (5, 8, CAST(N'2018-07-25' AS Date), CAST(N'10:00:00' AS Time), N'Dor de cabeça', N'Sem problemas graves', N'Analgésicos')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (2, 9, CAST(N'2023-01-28' AS Date), CAST(N'10:00:00' AS Time), N'Dor de barriga', N'Saudável', N'Nenhuma')
INSERT [dbo].[Visita_medica] ([id_recluso], [id_visita_medica], [data_consulta], [hora_consulta], [motivo], [diagnostico], [prescrição]) VALUES (4, 10, CAST(N'2022-08-31' AS Date), CAST(N'14:00:00' AS Time), N'Consulta de rotina', N'Saudável', N'Nenhuma')
SET IDENTITY_INSERT [dbo].[Visita_medica] OFF
GO
ALTER TABLE [dbo].[Atividade_reabilitaçao]  WITH CHECK ADD FOREIGN KEY([id_atividade])
REFERENCES [dbo].[Atividade] ([id_atividade])
GO
ALTER TABLE [dbo].[Atividade_reabilitaçao]  WITH CHECK ADD FOREIGN KEY([id_programa])
REFERENCES [dbo].[Programa_de_reabilitaçao] ([id_programa])
GO
ALTER TABLE [dbo].[Atividade_reabilitaçao]  WITH CHECK ADD FOREIGN KEY([id_recluso])
REFERENCES [dbo].[Recluso] ([id_recluso])
GO
ALTER TABLE [dbo].[Cela_recluso]  WITH CHECK ADD FOREIGN KEY([id_cela])
REFERENCES [dbo].[Cela] ([id_cela])
GO
ALTER TABLE [dbo].[Cela_recluso]  WITH CHECK ADD FOREIGN KEY([id_recluso])
REFERENCES [dbo].[Recluso] ([id_recluso])
GO
ALTER TABLE [dbo].[Crime_recluso]  WITH CHECK ADD FOREIGN KEY([id_crime])
REFERENCES [dbo].[Crime] ([id_crime])
GO
ALTER TABLE [dbo].[Crime_recluso]  WITH CHECK ADD FOREIGN KEY([id_recluso])
REFERENCES [dbo].[Recluso] ([id_recluso])
GO
ALTER TABLE [dbo].[Recluso]  WITH CHECK ADD FOREIGN KEY([codigo_postal])
REFERENCES [dbo].[Morada] ([codigo_postal])
GO
ALTER TABLE [dbo].[Recluso_inscritos]  WITH CHECK ADD FOREIGN KEY([id_programa])
REFERENCES [dbo].[Programa_de_reabilitaçao] ([id_programa])
GO
ALTER TABLE [dbo].[Recluso_inscritos]  WITH CHECK ADD FOREIGN KEY([id_recluso])
REFERENCES [dbo].[Recluso] ([id_recluso])
GO
ALTER TABLE [dbo].[Visita_medica]  WITH CHECK ADD FOREIGN KEY([id_recluso])
REFERENCES [dbo].[Recluso] ([id_recluso])
GO
ALTER TABLE [dbo].[Cela]  WITH CHECK ADD CHECK  (([capacidade]>=(1) AND [capacidade]<=(4)))
GO
ALTER TABLE [dbo].[Cela]  WITH CHECK ADD CHECK  (([id_cela]>=(1) AND [id_cela]<=(100)))
GO
ALTER TABLE [dbo].[Cela]  WITH CHECK ADD CHECK  (([ocupação]>=(0) AND [ocupação]<=(4)))
GO
ALTER TABLE [dbo].[Cela_recluso]  WITH CHECK ADD CHECK  (([id_cela]>=(1) AND [id_cela]<=(100)))
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
         Begin Table = "Recluso"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NViolentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NViolentos'
GO
USE [master]
GO
ALTER DATABASE [Prisao1] SET  READ_WRITE 
GO
