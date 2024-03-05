-- Eliminar la base de datos ItaliaPizzaDB si existe
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ItaliaPizzaDB')
    DROP DATABASE ItaliaPizzaDB;

-- Eliminar el inicio de sesión chefcito032 si existe
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'chefcito032')
    DROP LOGIN chefcito032;

--Crear base de datos
CREATE DATABASE ItaliaPizzaDB;

--Crear login y contraseña
CREATE LOGIN chefcito032 WITH PASSWORD = 'pollitoPio10';

--Asignar permisos
USE ItaliaPizzaDB;
CREATE USER chefcito032 FOR LOGIN chefcito032;
ALTER ROLE db_owner ADD MEMBER chefcito032;

--Crear tablas
CREATE TABLE Employee (
    email VARCHAR(30) PRIMARY KEY NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    firstLastName VARCHAR(50) NOT NULL,
    secondLastName VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    [role] VARCHAR(20) NOT NULL
);

CREATE TABLE Account (
    [user] VARCHAR(20) PRIMARY KEY NOT NULL,
    isAdmin TINYINT NOT NULL,
    [password] VARCHAR(8) NOT NULL,
    [status] TINYINT NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE Client (
    email VARCHAR(30) PRIMARY KEY NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    firstLastName VARCHAR(50) NOT NULL,
    secondLastName VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    [status] TINYINT NOT NULL,
);

CREATE TABLE [Address] (
    addressId INT PRIMARY KEY IDENTITY(1,1),
    street VARCHAR(60) NOT NULL,
    number INT NOT NULL,
    postalCode VARCHAR(10) NOT NULL,
    colony VARCHAR(50) NOT NULL,
    [status] TINYINT NOT NULL,
    clientId VARCHAR(30) NOT NULL
);

CREATE TABLE Dealer (
    phone VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    productCode VARCHAR(50) PRIMARY KEY NOT NULL,
    [status] TINYINT NOT NULL,
    amount INT NOT NULL,
    [description] TEXT NOT NULL,
    isExternal TINYINT NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    photo TEXT NOT NULL
);

CREATE TABLE Recipe (
    recipeCode VARCHAR(10) PRIMARY KEY NOT NULL,
    [description] TEXT NOT NULL,
    [status] TINYINT NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    ProductId VARCHAR(50) NOT NULL
);

CREATE TABLE Supply (
    [name] VARCHAR(50) PRIMARY KEY NOT NULL,
    amount INT NOT NULL,
    category VARCHAR(50) NOT NULL,
    expiryDate DATE NOT NULL,
    measurementUnit VARCHAR(20) NOT NULL
);

CREATE TABLE Supplier (
    email VARCHAR(30) PRIMARY KEY NOT NULL,
    phone VARCHAR(20) NOT NULL,
    supplyArea VARCHAR(30) NOT NULL,
    companyName VARCHAR(60) NOT NULL,
    manager VARCHAR(100) NOT NULL,
    [status] TINYINT NOT NULL
);

CREATE TABLE SupplierOrder (
    orderCode INT PRIMARY KEY IDENTITY(1,1),
    [status] TINYINT NOT NULL,
    [date] DATE NOT NULL,
    [time] TIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    supplierId VARCHAR(30) NOT NULL
);

CREATE TABLE Cashin (
    cashinId INT PRIMARY KEY IDENTITY(1,1),
    [date] DATE NOT NULL,
    [time] TIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Cashout (
    cashoutId INT PRIMARY KEY IDENTITY(1,1),
    [date] DATE NOT NULL,
    [time] TIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
	cashoutType VARCHAR(30) NOT NULL
);

CREATE TABLE RecipeSupply (
    recipeSupplyCode INT PRIMARY KEY IDENTITY(1,1),
    supplyAmount INT NOT NULL,
    recipeID VARCHAR(10) NOT NULL,
    supplyId VARCHAR(50) NOT NULL
);

CREATE TABLE SupplyOrder (
    supplyCode INT PRIMARY KEY IDENTITY(1,1),
    quantityOrdered INT NOT NULL,
    supplyId VARCHAR(50) NOT NULL,
    supplierOrderId INT NOT NULL
);

CREATE TABLE InternalOrder (
    internalOrderId INT PRIMARY KEY IDENTITY(1,1),
    [status] VARCHAR(20) NOT NULL,
    [date] DATE NOT NULL,
    [time] TIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    waiterName VARCHAR(30) NOT NULL
);

CREATE TABLE HouseOrder (
    houseOrderId INT PRIMARY KEY IDENTITY(1,1),
    [status] VARCHAR(30) NOT NULL,
    [date] DATE NOT NULL,
    [time] TIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    clientName VARCHAR(30) NOT NULL,
    dealerId VARCHAR(20) NOT NULL
);

CREATE TABLE InternalOrderProduct (
    internalOrderProductId INT PRIMARY KEY IDENTITY(1,1),
    amount INT NOT NULL,
    internalOrderId INT NOT NULL,
    productId VARCHAR(50) NOT NULL
);

CREATE TABLE HomeOrderProduct (
    OrderProductId INT PRIMARY KEY IDENTITY(1,1),
    amount INT NOT NULL,
    homeOrderId INT NOT NULL,
    productId VARCHAR(50) NOT NULL,
    addressId INT NOT NULL
);

ALTER TABLE InternalOrder
ADD CONSTRAINT FK_waiterName FOREIGN KEY (waiterName) REFERENCES Employee(email);

ALTER TABLE Account
ADD CONSTRAINT FK_Account_Employee FOREIGN KEY (email) REFERENCES Employee(email);

ALTER TABLE Address
ADD CONSTRAINT FK_ClientAddress FOREIGN KEY (clientId) REFERENCES Client(email);

ALTER TABLE Recipe
ADD CONSTRAINT FK_ProductId_Recipe
FOREIGN KEY (ProductId) REFERENCES Product(productCode);

ALTER TABLE SupplierOrder
ADD CONSTRAINT FK_SupplierOrder_Supplier
FOREIGN KEY (supplierId) REFERENCES Supplier(email);

ALTER TABLE RecipeSupply
ADD FOREIGN KEY (recipeID) REFERENCES Recipe(recipeCode);

ALTER TABLE RecipeSupply
ADD FOREIGN KEY (supplyId) REFERENCES Supply([name]);

ALTER TABLE SupplyOrder
ADD CONSTRAINT FK_SupplyId FOREIGN KEY (supplyId) REFERENCES Supply([name]);

ALTER TABLE SupplyOrder
ADD CONSTRAINT FK_SupplierOrderId FOREIGN KEY (supplierOrderId) REFERENCES SupplierOrder(orderCode);

ALTER TABLE InternalOrder
ADD CONSTRAINT FK_WaiterNameForOrder FOREIGN KEY (waiterName) REFERENCES Employee(email);

ALTER TABLE HouseOrder
ADD CONSTRAINT FK_ClientName FOREIGN KEY (clientName) REFERENCES Client(email);

ALTER TABLE HouseOrder
ADD CONSTRAINT FK_DealerId FOREIGN KEY (dealerId) REFERENCES Dealer(phone);

ALTER TABLE InternalOrderProduct
ADD CONSTRAINT FK_InternalOrderId FOREIGN KEY (internalOrderId) REFERENCES InternalOrder(internalOrderId);

ALTER TABLE InternalOrderProduct
ADD CONSTRAINT FK_ProductId FOREIGN KEY (productId) REFERENCES Product(productCode);

ALTER TABLE HomeOrderProduct
ADD CONSTRAINT FK_HomeOrderId FOREIGN KEY (homeOrderId) REFERENCES HouseOrder(houseOrderId);

ALTER TABLE HomeOrderProduct
ADD CONSTRAINT FK_HomeProductId FOREIGN KEY (productId) REFERENCES Product(productCode);


ALTER TABLE HomeOrderProduct
ADD CONSTRAINT FK_AddressId FOREIGN KEY (addressId) REFERENCES Address(addressId);