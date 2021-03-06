USE [DB_A38863_modnarxppa]
GO
/****** Object:  Table [dbo].[history]    Script Date: 4/12/2018 5:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[Match_ID] [bigint] NULL,
	[Host_ID] [bigint] NULL,
	[Guest_ID] [bigint] NULL,
	[Host_Num] [int] NULL,
	[Guest_Num] [int] NULL,
	[Winner_ID] [bigint] NULL,
	[Match_Date] [datetime] NULL,
	[Match_Remove_Date] [datetime] NULL,
	[Match_Price] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[match]    Script Date: 4/12/2018 5:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[match](
	[Match_ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Host_ID] [bigint] NULL,
	[Guest_ID] [bigint] NULL,
	[Host_Num] [int] NULL,
	[Guest_Num] [int] NULL,
	[Winner_ID] [bigint] NULL,
	[Match_Status] [bit] NULL,
	[Match_Date] [datetime] NULL,
	[Match_Price] [int] NULL,
	[Host_Rem_amount] [bigint] NULL,
	[Guest_Rem_amount] [bigint] NULL,
 CONSTRAINT [PK_match] PRIMARY KEY CLUSTERED 
(
	[Match_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[player]    Script Date: 4/12/2018 5:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[player](
	[Player_ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Player_Name] [nvarchar](50) NULL,
	[Player_Password] [nvarchar](50) NULL,
	[Player_Email] [nvarchar](50) NULL,
	[Player_Status] [bit] NULL,
	[Player_Win] [bigint] NULL,
	[Player_Loss] [bigint] NULL,
	[Player_Total] [bigint] NULL,
	[Player_Stars] [int] NULL,
 CONSTRAINT [PK_player] PRIMARY KEY CLUSTERED 
(
	[Player_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[history] ADD  CONSTRAINT [DF_history_Match_Remove_Date]  DEFAULT (getdate()) FOR [Match_Remove_Date]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Guest_ID]  DEFAULT ((0)) FOR [Guest_ID]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Host_Num]  DEFAULT ((0)) FOR [Host_Num]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Guest_Num]  DEFAULT ((0)) FOR [Guest_Num]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Winner_ID]  DEFAULT ((0)) FOR [Winner_ID]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Match_Status]  DEFAULT ((0)) FOR [Match_Status]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Match_Date]  DEFAULT (getdate()) FOR [Match_Date]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Match_Price]  DEFAULT ((0)) FOR [Match_Price]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Host_Rem_amount]  DEFAULT ((0)) FOR [Host_Rem_amount]
GO
ALTER TABLE [dbo].[match] ADD  CONSTRAINT [DF_match_Guest_Rem_amount]  DEFAULT ((0)) FOR [Guest_Rem_amount]
GO
ALTER TABLE [dbo].[player] ADD  CONSTRAINT [DF_player_Player_status]  DEFAULT ((0)) FOR [Player_Status]
GO
ALTER TABLE [dbo].[player] ADD  CONSTRAINT [DF_player_Player_win]  DEFAULT ((0)) FOR [Player_Win]
GO
ALTER TABLE [dbo].[player] ADD  CONSTRAINT [DF_player_Player_loss]  DEFAULT ((0)) FOR [Player_Loss]
GO
ALTER TABLE [dbo].[player] ADD  CONSTRAINT [DF_player_Player_Total]  DEFAULT ((1000)) FOR [Player_Total]
GO
ALTER TABLE [dbo].[player] ADD  CONSTRAINT [DF_player_Player_Stars]  DEFAULT ((3)) FOR [Player_Stars]
GO
