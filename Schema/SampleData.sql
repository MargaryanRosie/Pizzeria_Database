USE pizzeria_db;

INSERT INTO Customers(CustomerID, FirstName, LastName)
VALUES (1, 'John', 'Smith'),
		(2, 'Bob', 'Doe');

INSERT INTO Address(AddressID, DeliveryAddress1, DeliveryAddress2, DeliveryCity, DeliveryZipcode)
VALUES (1, '123 Pizza Street', '', 'Napoli', '12345'),
		(2, '456 Cheese Street', 'Apt 2B', 'Rome', '54321');

INSERT INTO Items(ItemID, ItemName, ItemCategory, ItemPrice, ItemSize, Sku)
VALUES ('PZ1', 'Margherita', 'Pizza', 8.99, 'Medium', 'SKU001'),
		('PZ2', 'Pepperoni', 'Pizza', 10.99, 'Large', 'SKU002');

INSERT INTO Ingredients(IngredientID, IngredientName, IngredientWeight, Measure, IngredientPrice)
VALUES ('ING1', 'Mozzarella', 100, 'grams', 0.5),
		('ING2', 'Tomato Sauce', 50, 'grams', 0.3);

INSERT INTO Recipe (RowID, RecipeID, IngredientID, Quantity, ItemID)
VALUES (1, 1, 'ING1', 1, 'PZ1'),
		(2, 1, 'ING2', 1, 'PZ1');

INSERT INTO Orders (OrderID, CreatedAt, CustomerID, Delivery, AddressID)
VALUES ('ORD1', '2025-07-29 18:30:00', 1, 1, 1);

INSERT INTO OrderItems (OrderID, ItemID, Quantity)
VALUES ('ORD1', 'PZ1', 2);

INSERT INTO Staff (StaffID, FirstName, LastName, Position, HourlyRate)
VALUES ('ST1', 'John', 'Bloson', 'Chef', 15.00),
		('ST2', 'Henry', 'White', 'Delivery', 12.00); 

INSERT INTO Shift (ShiftID, DayOfWeek, StartTime, EndTime)
VALUES ('SH1', 'Monday', '10:00', '18:00');

INSERT INTO Schedule (RowID, ScheduleID, Date, ShiftID, StaffID)
VALUES (1, 'SC1', '2025-07-29', 'SH1', 'ST1');

INSERT INTO OrderStaff (OrderRowID, StaffID)
VALUES ('ORD1', 'ST1');
