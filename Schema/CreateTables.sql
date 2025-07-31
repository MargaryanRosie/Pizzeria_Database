CREATE DATABASE pizzeria_db;

USE pizzeria_db;

CREATE TABLE Customers(
	CustomerID int NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	PRIMARY KEY(CustomerID)
);

CREATE TABLE Address(
	AddressID int NOT NULL,
	DeliveryAddress1 varchar(200) NOT NULL,
	DeliveryAddress2 varchar(200) NOT NULL,
	DeliveryCity varchar(50) NOT NULL,
	DeliveryZipcode varchar(20) NOT NULL,
	PRIMARY KEY(AddressID)
);

CREATE TABLE Items(
	ItemID varchar(10) NOT NULL,
	ItemName varchar(50) NOT NULL,
	ItemCategory varchar(50) NOT NULL,
	ItemPrice decimal(5, 2) NOT NULL,
	-- -999.99 - +999.99
	PRIMARY KEY(ItemID)
);

CREATE TABLE Orders(
	OrderID varchar(10) NOT NULL,
	CreatedAt datetime NOT NULL,
	CustomerID int NOT NULL,
	Delivery BIT NOT NULL,    -- 1 if its a delivery, 0 if its pickup
	AddressID int NOT NULL,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY(AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE OrderItems(
	OrderID varchar(10) NOT NULL,
	ItemID varchar(10) NOT NULL,
	Quantity int NOT NULL,
	PRIMARY KEY(ItemID, OrderID),
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
);


--STOCK CONTROL

CREATE TABLE Recipe(
	RowID int NOT NULL,
	RecipeID int NOT NULL,
	IngredientID varchar(10) NOT NULL,
	Quantity int NOT NULL,
	PRIMARY KEY(RowID)
);

CREATE TABLE Ingredients(
	IngredientID varchar(10) NOT NULL,
	IngredientName varchar(200) NOT NULL,
	IngredientWeight int NOT NULL,
	Measure varchar(20) NOT NULL,
	IngredientPrice decimal(5,2) NOT NULL,
	PRIMARY KEY(IngredientID)
);

CREATE TABLE Resources(
	ResourceID int NOT NULL,
	ItemID varchar(10) NOT NULL,
	Quantity int NOT NULL,
	PRIMARY KEY(ResourceID),
	FOREIGN KEY(ItemID) REFERENCES Items(ItemID)
);



-- STAFF DATA

-- The overall cost of making the pizza will include:
-- 1) Ingredient costs
-- 2) Chef's time
-- 3) Delivery costs


CREATE TABLE Staff(
	StaffID varchar(20) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Position varchar(100) NOT NULL,
	HourlyRate decimal(5, 2) NOT NULL,
	PRIMARY KEY(StaffID)
);


CREATE TABLE Shift(
	ShiftID	varchar(20) NOT NULL,
	DayOfWeek varchar(20) NOT NULL,
	StartTime time NOT NULL,
	EndTime time NOT NULL,
	PRIMARY KEY(ShiftID)
);


CREATE TABLE Schedule(   
	RowID int NOT NULL,
    ScheduleID varchar(20) NOT NULL,
	Date datetime NOT NULL,
	ShiftID varchar(20) NOT NULL,
	StaffID varchar(20) NOT NULL,
	PRIMARY KEY(RowID),
	FOREIGN KEY(ShiftID) REFERENCES Shift(ShiftID),
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);


CREATE TABLE OrderStaff(
	OrderRowID varchar(10) NOT NULL,
	StaffID varchar(20) NOT NULL,
	PRIMARY KEY(OrderRowID, StaffID),
	FOREIGN KEY(OrderRowID) REFERENCES Orders(OrderID),
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);


