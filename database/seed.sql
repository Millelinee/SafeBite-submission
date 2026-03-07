USE SafeBite;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Product_Ingredients;
TRUNCATE TABLE Ingredient_Allergens;
TRUNCATE TABLE User_Allergies;
TRUNCATE TABLE Products;
TRUNCATE TABLE Ingredients;
TRUNCATE TABLE Allergens;
TRUNCATE TABLE Users;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO Allergens (name) VALUES
('Milk'),
('Nuts'),
('Soy'),
('Gluten'),
('Egg');


INSERT INTO Ingredients (name, description) VALUES
('Sugar', 'Sweetener'),
('Cocoa Butter', 'Fat extracted from cocoa beans'),
('Cocoa Mass', 'Ground cocoa beans'),
('Whey Powder', 'Milk-based powder'),
('Skimmed Milk Powder', 'Low-fat milk powder'),
('Milk Fat', 'Butter fat from milk'),
('Whey Product', 'Milk-derived product'),
('Soy Lecithin', 'Emulsifier derived from soy'),
('Flavoring', 'Aroma compound'),
('Palm Oil', 'Vegetable oil'),
('Almonds', 'Nut ingredient'),
('Sweetened Condensed Skimmed Milk', 'Sweetened milk product'),
('Salt', 'Mineral seasoning'),
('Glucose Syrup', 'Sugar syrup'),
('Hazelnuts', 'Nut ingredient'),
('Pistachios', 'Nut ingredient'),
('Sunflower Oil', 'Vegetable oil'),
('Wheat Flour', 'Flour containing gluten'),
('Shea Butter', 'Vegetable fat'),
('Coconut Oil', 'Vegetable oil'),
('Whole Milk Powder', 'Full fat milk powder'),
('Reduced Fat Cocoa Powder', 'Low fat cocoa powder'),
('Sodium Hydrogen Carbonate', 'Raising agent'),
('Vanillin', 'Artificial vanilla flavor'),
('Whey Permeate', 'Milk-derived ingredient with low protein content'),
('Milk', 'Liquid milk ingredient'),
('Buttermilk Powder', 'Dried fermented milk powder'),
('Corn Starch', 'Starch derived from corn'),
('Peanuts', 'Nut ingredient'),
('Corn Syrup', 'Sweet syrup'),
('Lactose', 'Milk sugar'),
('Egg Whites', 'Egg protein'),
('Artificial Flavor', 'Flavoring additive'),
('Egg', 'Whole egg'),
('Hazelnut Mass', 'Ground hazelnuts'),
('Ground Vanilla Beans', 'Ground natural vanilla pods'),
('Almond Flour', 'Flour made from ground almonds'),
('Maltodextrin', 'Starch derived thickener and stabilizer'),
('Oat Flour', 'Flour made from oats'),
('Millet Syrup', 'Sweet syrup made from fermented millet grains');


INSERT INTO Products (name, brand, barcode, category) VALUES
('Mjölkchoklad', 'Marabou', '7622201727390', 'Chocolate'),
('Mintkrokant', 'Marabou', '7622201727758', 'Chocolate'),
('Salta Mandlar', 'Marabou', '7622201727512', 'Chocolate'),
('Schweizernöt', 'Marabou', '7622201727420', 'Chocolate'),
('Daim', 'Marabou', '7622201727789', 'Chocolate'),
('Pistachio', 'Marabou', '7622201507510', 'Chocolate'),
('Kex Choklad', 'Cloetta', '7310350118342', 'Chocolate'),
('Kinder Bueno', 'Kinder', '8000500037560', 'Chocolate'),
('Geisha', 'Fazer', '6411401019029', 'Chocolate'),
('Snickers', 'Snickers', '5900951311505', 'Chocolate'),
('Mild Classic', 'Ritter Sport', '4000417109101', 'Chocolate'),
('Hello Vegan Salted Caramel', 'Lindt', '4000539245701', 'Chocolate'),
('Twix', 'Twix', '5900951313592', 'Chocolate'),
('Daim Dubbel', 'Daim', '7310511257507', 'Chocolate'),
('Fin 86% Marabou Premium', 'Marabou', '7622400928574', 'Chocolate');


INSERT INTO Product_Ingredients VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9);

INSERT INTO Product_Ingredients VALUES
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,11),(2,12),(2,8),(2,13),(2,9),(2,10);

INSERT INTO Product_Ingredients VALUES
(3,1),(3,2),(3,3),(3,11),(3,4),(3,5),(3,6),(3,7),(3,8),(3,14),(3,13),(3,9);

INSERT INTO Product_Ingredients VALUES
(4,1),(4,2),(4,15),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9);

INSERT INTO Product_Ingredients VALUES
(5,1),(5,2),(5,3),(5,10),(5,4),(5,5),(5,6),(5,7),(5,11),(5,12),(5,8),(5,13),(5,9);

INSERT INTO Product_Ingredients VALUES
(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,16),(6,14),(6,17),(6,8),(6,13),(6,9);

INSERT INTO Product_Ingredients VALUES
(7,1),(7,18),(7,10),(7,5),(7,4),(7,2),(7,21),(7,3),(7,22),(7,8),(7,13),(7,23),(7,9);

INSERT INTO Product_Ingredients VALUES
(8,1),(8,10),(8,18),(8,15),(8,5),(8,21),(8,3),(8,2),(8,22),(8,8),(8,23),(8,13),(8,24);

INSERT INTO Product_Ingredients VALUES
(9,1),(9,26),(9,2),(9,15),(9,3),(9,21),(9,27),(9,19),(9,18),(9,28),(9,8),(9,13),(9,9);

INSERT INTO Product_Ingredients VALUES
(10,1),(10,2),(10,3),(10,5),(10,31),(10,6),(10,8),(10,29),(10,30),(10,10),(10,13),(10,32),(10,33),(10,34);

INSERT INTO Product_Ingredients VALUES
(11,1),(11,3),(11,2),(11,37),(11,35),(11,8),(11,36);

INSERT INTO Product_Ingredients VALUES
(12,1),(12,2),(12,3),(12,11),(12,14),(12,8),(12,13),(12,9),(12,38),(12,39),(12,40);

INSERT INTO Product_Ingredients VALUES
(13,1),(13,18),(13,10),(13,5),(13,25),(13,2),(13,6),(13,3),(13,22),(13,8),(13,13),(13,23),(13,9);

INSERT INTO Product_Ingredients VALUES
(14,1),(14,2),(14,3),(14,10),(14,4),(14,5),(14,6),(14,7),(14,11),(14,12),(14,8),(14,13),(14,9);

INSERT INTO Product_Ingredients VALUES
(15,3),(15,2),(15,22),(15,1),(15,9),(15,8),(15,5);


INSERT INTO Ingredient_Allergens VALUES

(4,1),(5,1),(6,1),(7,1),(12,1),(21,1),(25,1),(26,1),(27,1),(31,1),

(11,2),(15,2),(16,2),(29,2),(35,2),(37,2),

(8,3),

(18,4),(39,4),

(32,5),(34,5);
