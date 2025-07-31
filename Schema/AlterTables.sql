ALTER TABLE Items
ADD ItemSize varchar(20) NOT NULL;

ALTER TABLE Items
ADD Sku varchar(20) NOT NULL;         -- unique code that the business gives each unique product

ALTER TABLE OrderItems
ADD CONSTRAINT fk_OrderItems_Items
FOREIGN KEY(ItemID)
REFERENCES Items(ItemID);

ALTER TABLE Recipe
ADD CONSTRAINT fk_recipe_ingredients
FOREIGN KEY(IngredientID)
REFERENCES Ingredients(IngredientID);

ALTER TABLE Recipe
ADD ItemID varchar(10) NOT NULL

ALTER TABLE Recipe
ADD CONSTRAINT fk_recipe_item
FOREIGN KEY(ItemID) REFERENCES Items(ItemID);