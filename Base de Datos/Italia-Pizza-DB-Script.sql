-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Account'
CREATE TABLE [Account] (
    [user] varchar(20)  NOT NULL,
    [isAdmin] tinyint  NOT NULL,
    [password] varchar(64)  NULL,
    [status] tinyint  NOT NULL,
    [email] varchar(30)  NOT NULL
);
GO

-- Creating table 'Address'
CREATE TABLE [Address] (
    [addressId] int IDENTITY(1,1) NOT NULL,
    [street] varchar(60)  NOT NULL,
    [postalCode] varchar(10)  NOT NULL,
    [colony] varchar(50)  NOT NULL,
    [status] tinyint  NOT NULL,
    [clientId] varchar(30)  NOT NULL
);
GO

-- Creating table 'Cashout'
CREATE TABLE [Cashout] (
    [cashoutId] int IDENTITY(1,1) NOT NULL,
    [date] datetime  NOT NULL,
    [time] time  NOT NULL,
    [total] decimal(10,2)  NOT NULL,
    [cashoutType] varchar(30)  NOT NULL
);
GO

-- Creating table 'Client'
CREATE TABLE [Client] (
    [email] varchar(30)  NOT NULL,
    [name] varchar(50)  NOT NULL,
    [phone] varchar(20)  NOT NULL,
    [status] tinyint  NOT NULL
);
GO

-- Creating table 'ColonyCatalog'
CREATE TABLE [ColonyCatalog] (
    [idColony] int IDENTITY(1,1) NOT NULL,
    [code] varchar(10)  NOT NULL,
    [settlement] varchar(250)  NULL,
    [typeSettlement] varchar(250)  NULL,
    [municipality] varchar(250)  NULL,
    [state] varchar(250)  NULL,
    [city] varchar(250)  NULL
);
GO

-- Creating table 'Employee'
CREATE TABLE [Employee] (
    [email] varchar(30)  NOT NULL,
    [name] varchar(50)  NOT NULL,
    [phone] varchar(20)  NOT NULL,
    [role] varchar(20)  NOT NULL
);
GO

-- Creating table 'HomeOrderProduct'
CREATE TABLE [HomeOrderProduct] (
    [OrderProductId] int IDENTITY(1,1) NOT NULL,
    [amount] int  NOT NULL,
    [homeOrderId] varchar(15)  NOT NULL,
    [isConfirmed] tinyint NOT NULL,
    [productId] varchar(50)  NOT NULL,
    [addressId] int  NOT NULL
);
GO

-- Creating table 'HomeOrder'
CREATE TABLE [HomeOrder] (
    [homeOrderId] VARCHAR(15) NOT NULL,
    [status] INT  NOT NULL,
    [date] datetime  NOT NULL,
    [time] time  NOT NULL,
    [total] decimal(10,2)  NOT NULL,
    [clientName] varchar(30)  NOT NULL
);
GO

-- Creating table 'InternalOrder'
CREATE TABLE [InternalOrder] (
    [internalOrderId] VARCHAR(15) NOT NULL,
    [status] INT  NOT NULL,
    [date] datetime  NOT NULL,
    [time] time  NOT NULL,
    [total] decimal(10,2)  NOT NULL,
    [waiterEmail] varchar(30)  NOT NULL
);
GO

-- Creating table 'InternalOrderProduct'
CREATE TABLE [InternalOrderProduct] (
    [internalOrderProductId] int IDENTITY(1,1) NOT NULL,
    [amount] int  NOT NULL,
    [isConfirmed] tinyint NOT NULL,
    [internalOrderId] VARCHAR(15)  NOT NULL,
    [productId] varchar(50)  NOT NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [Product] (
    [productCode] varchar(50)  NOT NULL,
    [status] tinyint  NOT NULL,
    [amount] int  NULL,
    [description] varchar(max)  NOT NULL,
    [isExternal] tinyint  NOT NULL,
    [name] varchar(100)  NOT NULL,
    [price] decimal(5,2)  NOT NULL,
    [picture] varbinary(max)  NULL
);
GO

-- Creating table 'Recipe'
CREATE TABLE [Recipe] (
    [recipeCode] INT IDENTITY(1,1)  NOT NULL,
    [description] varchar(max)  NOT NULL,
    [status] tinyint  NOT NULL,
    [name] varchar(50)  NOT NULL,
    [ProductId] varchar(50)  NOT NULL
);
GO

-- Creating table 'RecipeSupply'
CREATE TABLE [RecipeSupply] (
    [recipeSupplyCode] int IDENTITY(1,1) NOT NULL,
    [supplyAmount] DECIMAL(6,3)  NOT NULL,
    [recipeID] int  NOT NULL,
    [supplyId] varchar(50)  NOT NULL
);
GO

-- Creating table 'Supplier'
CREATE TABLE [Supplier] (
    [email] varchar(30)  NOT NULL,
    [phone] varchar(20)  NOT NULL,
    [companyName] varchar(60)  NOT NULL,
    [manager] varchar(100)  NOT NULL,
    [status] tinyint  NOT NULL
);
GO

-- Creating table 'SupplierOrder'
CREATE TABLE [SupplierOrder] (
    [orderCode] int IDENTITY(1,1) NOT NULL,
    [status] tinyint  NOT NULL,
    [date] datetime  NOT NULL,
    [time] time  NOT NULL,
    [modificationDate] datetime NOT NULL,
    [total] decimal(10,2)  NOT NULL,
    [supplierId] varchar(30)  NOT NULL
);
GO

-- Creating table 'Supply'
CREATE TABLE [Supply] (
    [name] varchar(50)  NOT NULL,
    [amount] decimal(6,3)  NOT NULL,
    [category] int  NOT NULL,
    [measurementUnit] varchar(20)  NOT NULL,
    [status] bit NOT NULL
);
GO

-- Crear tabla CashierLog
CREATE TABLE [CashierLog] (
    [logId] INT PRIMARY KEY IDENTITY(1,1),
    [creationDate] DATE NOT NULL,
    [creationTime] TIME NOT NULL,
    [employeeId] VARCHAR(30) NOT NULL,
    [report] VARBINARY(MAX) NOT NULL
);
GO

-- Crear la tabla StatusOrder
CREATE TABLE [StatusOrder] (
    [statusId] INT PRIMARY KEY IDENTITY(1,1),
    [type] NVARCHAR(25)
);
GO

-- Creating table 'SupplyArea'
CREATE TABLE [SupplyArea] (
    [area_id] int IDENTITY(1,1)NOT NULL,
    [area_name] nvarchar(50)  NULL
);
GO

-- Creating table 'SupplyOrder'
CREATE TABLE [SupplyOrder] (
    [supplyOrderCode] int IDENTITY(1,1) NOT NULL,
    [quantityOrdered] int  NOT NULL,
    [supplyId] varchar(50)  NOT NULL,
    [supplierOrderId] int  NOT NULL
);
GO

-- Creating table 'Supplier_SupplyArea'
CREATE TABLE [Supplier_SupplyArea] (
    [Supplier_email] varchar(30)  NOT NULL,
    [SupplyArea_area_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [user] in table 'Account'
ALTER TABLE [Account]
ADD CONSTRAINT [PK_Account]
    PRIMARY KEY CLUSTERED ([user] ASC);
GO

-- Creating primary key on [addressId] in table 'Address'
ALTER TABLE [Address]
ADD CONSTRAINT [PK_Address]
    PRIMARY KEY CLUSTERED ([addressId] ASC);
GO

-- Creating primary key on [cashoutId] in table 'Cashout'
ALTER TABLE [Cashout]
ADD CONSTRAINT [PK_Cashout]
    PRIMARY KEY CLUSTERED ([cashoutId] ASC);
GO

-- Creating primary key on [email] in table 'Client'
ALTER TABLE [Client]
ADD CONSTRAINT [PK_Client]
    PRIMARY KEY CLUSTERED ([email] ASC);
GO

-- Creating primary key on [idColony] in table 'ColonyCatalog'
ALTER TABLE [ColonyCatalog]
ADD CONSTRAINT [PK_ColonyCatalog]
    PRIMARY KEY CLUSTERED ([idColony] ASC);
GO

-- Creating primary key on [email] in table 'Employee'
ALTER TABLE [Employee]
ADD CONSTRAINT [PK_Employee]
    PRIMARY KEY CLUSTERED ([email] ASC);
GO

-- Creating primary key on [OrderProductId] in table 'HomeOrderProduct'
ALTER TABLE [HomeOrderProduct]
ADD CONSTRAINT [PK_HomeOrderProduct]
    PRIMARY KEY CLUSTERED ([OrderProductId] ASC);
GO

-- Creating primary key on [homeOrderId] in table 'HomeOrder'
ALTER TABLE [HomeOrder]
ADD CONSTRAINT [PK_HomeOrder]
    PRIMARY KEY CLUSTERED ([homeOrderId] ASC);
GO

-- Creating primary key on [internalOrderId] in table 'InternalOrder'
ALTER TABLE [InternalOrder]
ADD CONSTRAINT [PK_InternalOrder]
    PRIMARY KEY CLUSTERED ([internalOrderId] ASC);
GO

-- Creating primary key on [internalOrderProductId] in table 'InternalOrderProduct'
ALTER TABLE [InternalOrderProduct]
ADD CONSTRAINT [PK_InternalOrderProduct]
    PRIMARY KEY CLUSTERED ([internalOrderProductId] ASC);
GO

-- Creating primary key on [productCode] in table 'Product'
ALTER TABLE [Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([productCode] ASC);
GO

-- Creating primary key on [recipeCode] in table 'Recipe'
ALTER TABLE [Recipe]
ADD CONSTRAINT [PK_Recipe]
    PRIMARY KEY CLUSTERED ([recipeCode] ASC);
GO

-- Creating primary key on [recipeSupplyCode] in table 'RecipeSupply'
ALTER TABLE [RecipeSupply]
ADD CONSTRAINT [PK_RecipeSupply]
    PRIMARY KEY CLUSTERED ([recipeSupplyCode] ASC);
GO

-- Creating primary key on [email] in table 'Supplier'
ALTER TABLE [Supplier]
ADD CONSTRAINT [PK_Supplier]
    PRIMARY KEY CLUSTERED ([email] ASC);
GO

-- Creating primary key on [orderCode] in table 'SupplierOrder'
ALTER TABLE [SupplierOrder]
ADD CONSTRAINT [PK_SupplierOrder]
    PRIMARY KEY CLUSTERED ([orderCode] ASC);
GO

-- Creating primary key on [name] in table 'Supply'
ALTER TABLE [Supply]
ADD CONSTRAINT [PK_Supply]
    PRIMARY KEY CLUSTERED ([name] ASC);
GO

-- Creating primary key on [area_id] in table 'SupplyArea'
ALTER TABLE [SupplyArea]
ADD CONSTRAINT [PK_SupplyArea]
    PRIMARY KEY CLUSTERED ([area_id] ASC);
GO

-- Creating primary key on [supplyCode] in table 'SupplyOrder'
ALTER TABLE [SupplyOrder]
ADD CONSTRAINT [PK_SupplyOrder]
    PRIMARY KEY CLUSTERED ([supplyOrderCode] ASC);
GO
-- Creating primary key on [Supplier_email], [SupplyArea_area_id] in table 'Supplier_SupplyArea'
ALTER TABLE [Supplier_SupplyArea]
ADD CONSTRAINT [PK_Supplier_SupplyArea]
    PRIMARY KEY CLUSTERED ([Supplier_email], [SupplyArea_area_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [email] in table 'Account'
ALTER TABLE [Account]
ADD CONSTRAINT [FK_Account_Employee]
    FOREIGN KEY ([email])
    REFERENCES [Employee]
        ([email])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Relacionar la columna category de la tabla Supply con la tabla SupplyArea
ALTER TABLE Supply
ADD CONSTRAINT FK_Supply_SupplyArea
    FOREIGN KEY (category)
    REFERENCES SupplyArea(area_id)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- Creating non-clustered index for FOREIGN KEY 'FK_Account_Employee'
CREATE INDEX [IX_FK_Account_Employee]
ON [Account]
    ([email]);
GO

-- Creating foreign key on [addressId] in table 'HomeOrderProduct'
ALTER TABLE [HomeOrderProduct]
ADD CONSTRAINT [FK_AddressId]
    FOREIGN KEY ([addressId])
    REFERENCES [Address]
        ([addressId])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AddressId'
CREATE INDEX [IX_FK_AddressId]
ON [HomeOrderProduct]
    ([addressId]);
GO

-- Creating foreign key on [clientId] in table 'Address'
ALTER TABLE [Address]
ADD CONSTRAINT [FK_ClientAddress]
    FOREIGN KEY ([clientId])
    REFERENCES [Client]
        ([email])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientAddress'
CREATE INDEX [IX_FK_ClientAddress]
ON [Address]
    ([clientId]);
GO

-- Creating foreign key on [clientName] in table 'HomeOrder'
ALTER TABLE [HomeOrder]
ADD CONSTRAINT [FK_ClientName]
    FOREIGN KEY ([clientName])
    REFERENCES [Client]
        ([email])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientName'
CREATE INDEX [IX_FK_ClientName]
ON [HomeOrder]
    ([clientName]);
GO

-- Creating foreign key on [waiterEmail] in table 'InternalOrder'
ALTER TABLE [InternalOrder]
ADD CONSTRAINT [FK_waiterEmail]
    FOREIGN KEY ([waiterEmail])
    REFERENCES [Employee]
        ([email])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_waiterEmail'
CREATE INDEX [IX_FK_waiterEmail]
ON [InternalOrder]
    ([waiterEmail]);
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeForCashier'
CREATE INDEX [IX_FK_EmployeeForCashier]
ON [CashierLog]
    ([employeeId]);
GO

-- Creating foreign key on [employeeId] in table 'CashierLog'
ALTER TABLE [CashierLog]
ADD CONSTRAINT [FK_EmployeeForCashier]
    FOREIGN KEY ([employeeId])
    REFERENCES [Employee]
        ([email])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [homeOrderId] in table 'HomeOrderProduct'
ALTER TABLE [HomeOrderProduct]
ADD CONSTRAINT [FK_HomeOrderId]
    FOREIGN KEY ([homeOrderId])
    REFERENCES [HomeOrder]
        ([homeOrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HomeOrderId'
CREATE INDEX [IX_FK_HomeOrderId]
ON [HomeOrderProduct]
    ([homeOrderId]);
GO

-- Creating foreign key on [productId] in table 'HomeOrderProduct'
ALTER TABLE [HomeOrderProduct]
ADD CONSTRAINT [FK_HomeProductId]
    FOREIGN KEY ([productId])
    REFERENCES [Product]
        ([productCode])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HomeProductId'
CREATE INDEX [IX_FK_HomeProductId]
ON [HomeOrderProduct]
    ([productId]);
GO

-- Creating foreign key on [internalOrderId] in table 'InternalOrderProduct'
ALTER TABLE [InternalOrderProduct]
ADD CONSTRAINT [FK_InternalOrderId]
    FOREIGN KEY ([internalOrderId])
    REFERENCES [InternalOrder]
        ([internalOrderId])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InternalOrderId'
CREATE INDEX [IX_FK_InternalOrderId]
ON [InternalOrderProduct]
    ([internalOrderId]);
GO

-- Creating foreign key on [productId] in table 'InternalOrderProduct'
ALTER TABLE [InternalOrderProduct]
ADD CONSTRAINT [FK_ProductId]
    FOREIGN KEY ([productId])
    REFERENCES [Product]
        ([productCode])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductId'
CREATE INDEX [IX_FK_ProductId]
ON [InternalOrderProduct]
    ([productId]);
GO

-- Creating foreign key on [ProductId] in table 'Recipe'
ALTER TABLE [Recipe]
ADD CONSTRAINT [FK_ProductId_Recipe]
    FOREIGN KEY ([ProductId])
    REFERENCES [Product]
        ([productCode])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductId_Recipe'
CREATE INDEX [IX_FK_ProductId_Recipe]
ON [Recipe]
    ([ProductId]);
GO

-- Creating foreign key on [recipeID] in table 'RecipeSupply'
ALTER TABLE [RecipeSupply]
ADD CONSTRAINT [FK_Recipeuprecip_02084FDA]
    FOREIGN KEY ([recipeID])
    REFERENCES [Recipe]
        ([recipeCode])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Recipeuprecip_02084FDA'
CREATE INDEX [IX_FK_Recipeuprecip_02084FDA]
ON [RecipeSupply]
    ([recipeID]);
GO

-- Creating foreign key on [supplyId] in table 'RecipeSupply'
ALTER TABLE [RecipeSupply]
ADD CONSTRAINT [FK_Recipeupsuppl_02FC7413]
    FOREIGN KEY ([supplyId])
    REFERENCES [Supply]
        ([name])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Recipeupsuppl_02FC7413'
CREATE INDEX [IX_FK_Recipeupsuppl_02FC7413]
ON [RecipeSupply]
    ([supplyId]);
GO

-- Creating foreign key on [supplierId] in table 'SupplierOrder'
ALTER TABLE [SupplierOrder]
ADD CONSTRAINT [FK_SupplierOrder_Supplier]
    FOREIGN KEY ([supplierId])
    REFERENCES [Supplier]
        ([email])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplierOrder_Supplier'
CREATE INDEX [IX_FK_SupplierOrder_Supplier]
ON [SupplierOrder]
    ([supplierId]);
GO

-- Creating foreign key on [supplierOrderId] in table 'SupplyOrder'
ALTER TABLE [SupplyOrder]
ADD CONSTRAINT [FK_SupplierOrderId]
    FOREIGN KEY ([supplierOrderId])
    REFERENCES [SupplierOrder]
        ([orderCode])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplierOrderId'
CREATE INDEX [IX_FK_SupplierOrderId]
ON [SupplyOrder]
    ([supplierOrderId]);
GO

-- Creating foreign key on [supplyId] in table 'SupplyOrder'
ALTER TABLE [SupplyOrder]
ADD CONSTRAINT [FK_SupplyId]
    FOREIGN KEY ([supplyId])
    REFERENCES [Supply]
        ([name])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplyId'
CREATE INDEX [IX_FK_SupplyId]
ON [SupplyOrder]
    ([supplyId]);
GO

-- Creating foreign key on [Supplier_email] in table 'Supplier_SupplyArea'
ALTER TABLE [Supplier_SupplyArea]
ADD CONSTRAINT [FK_Supplier_SupplyArea_Supplier]
    FOREIGN KEY ([Supplier_email])
    REFERENCES [Supplier]
        ([email])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating foreign key on [SupplyArea_area_id] in table 'Supplier_SupplyArea'
ALTER TABLE [Supplier_SupplyArea]
ADD CONSTRAINT [FK_Supplier_SupplyArea_SupplyArea]
    FOREIGN KEY ([SupplyArea_area_id])
    REFERENCES [SupplyArea]
        ([area_id])
    ON DELETE CASCADE ON UPDATE CASCADE;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Supplier_SupplyArea_SupplyArea'
CREATE INDEX [IX_FK_Supplier_SupplyArea_SupplyArea]
ON [Supplier_SupplyArea]
    ([SupplyArea_area_id]);
GO

-- --------------------------------------------------
-- Llenando datos escenciales
-- --------------------------------------------------

-- Insertar datos en la tabla SupplyArea
INSERT INTO SupplyArea (area_name)
VALUES 
    ('Carnes frías'),
    ('Verduras'),
    ('Especias'),
    ('Lácteos');

-- Insertar estados de orden
INSERT INTO StatusOrder (type)
VALUES 
    ('En captura'),
    ('En espera de preparación'),
    ('En preparación'),
    ('Preparado'),
    ('Enviado'),
    ('Entregado');

--- Un FK que faltaba en orders
ALTER TABLE InternalOrder
ADD CONSTRAINT FK_StatusOrder_InternalOrders FOREIGN KEY (status) REFERENCES StatusOrder(statusId);

ALTER TABLE HomeOrder
ADD CONSTRAINT FK_StatusOrder_HomeOrders FOREIGN KEY (status) REFERENCES StatusOrder(statusId);

--- CREAR FUNCION PARA SACAR CUANTO DE UN PRODUCTO SE PUEDE PREPARAR:
/*CREATE FUNCTION  [dbo].[VALIDATEINGREDIENTSAMOUNT] (@RecipeId INT)
RETURNS INT
AS
BEGIN
    DECLARE @minimumTotal INT = 0;

    DECLARE @ingredientsNeedle TABLE (
        supplyID NVARCHAR(50), 
        supplyAmount FLOAT
    );

    INSERT INTO @ingredientsNeedle (supplyID, supplyAmount)
    SELECT supplyId, supplyAmount
    FROM RecipeSupply
    WHERE recipeID = @RecipeId

    DECLARE @ingredient NVARCHAR(50);
    DECLARE @amountNeedle FLOAT;
    DECLARE @amountAvailable FLOAT;
    DECLARE @provisionalTotal INT = 0;

    DECLARE ingredientes_cursor CURSOR FOR
    SELECT S.name, RS.supplyAmount
    FROM @ingredientsNeedle AS RS
    INNER JOIN Supply AS S ON RS.supplyId = S.name;

    OPEN ingredientes_cursor
    FETCH NEXT FROM ingredientes_cursor INTO @ingredient, @amountNeedle; 

    SELECT @amountAvailable = amount
    FROM Supply
    WHERE name  = @ingredient;

    SET @minimumTotal = CAST (@amountAvailable/@amountNeedle AS INT);
    FETCH NEXT FROM ingredientes_cursor INTO @ingredient, @amountNeedle;

    WHILE @@FETCH_STATUS = 0
    BEGIN 
        SELECT @amountAvailable = amount
        FROM Supply
        WHERE name  = @ingredient;
        BEGIN 
            SET @provisionalTotal = CAST (@amountAvailable/@amountNeedle AS INT);
            IF @provisionalTotal <= @minimumTotal
                SET @minimumTotal = @provisionalTotal
        END
        FETCH NEXT FROM ingredientes_cursor INTO @ingredient, @amountNeedle;
    END
    CLOSE ingredientes_cursor;
    DEALLOCATE ingredientes_cursor;
    RETURN @minimumTotal
END*/
