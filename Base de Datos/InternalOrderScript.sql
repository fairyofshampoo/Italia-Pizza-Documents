SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalOrder](
	[internalOrderId] [varchar](15) NOT NULL,
	[status] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[waiterEmail] [varchar](30) NULL,
	[clientEmail] [varchar](30) NULL,
	[addressId] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[InternalOrder] ADD  CONSTRAINT [PK_InternalOrder] PRIMARY KEY CLUSTERED 
(
	[internalOrderId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_FK_waiterEmail] ON [dbo].[InternalOrder]
(
	[waiterEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternalOrder]  WITH CHECK ADD  CONSTRAINT [FK_AddressID] FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[InternalOrder] CHECK CONSTRAINT [FK_AddressID]
GO
ALTER TABLE [dbo].[InternalOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClientEmail] FOREIGN KEY([clientEmail])
REFERENCES [dbo].[Client] ([email])
GO
ALTER TABLE [dbo].[InternalOrder] CHECK CONSTRAINT [FK_ClientEmail]
GO
ALTER TABLE [dbo].[InternalOrder]  WITH CHECK ADD  CONSTRAINT [FK_StatusOrder_InternalOrders] FOREIGN KEY([status])
REFERENCES [dbo].[StatusOrder] ([statusId])
GO
ALTER TABLE [dbo].[InternalOrder] CHECK CONSTRAINT [FK_StatusOrder_InternalOrders]
GO
ALTER TABLE [dbo].[InternalOrder]  WITH CHECK ADD  CONSTRAINT [FK_waiterEmail] FOREIGN KEY([waiterEmail])
REFERENCES [dbo].[Employee] ([email])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InternalOrder] CHECK CONSTRAINT [FK_waiterEmail]
GO
