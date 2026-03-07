USE SafeBite;


CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    barcode VARCHAR(50) UNIQUE,
    category VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS Allergens (
    allergen_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS Product_Ingredients (
    product_id INT,
    ingredient_id INT,
    PRIMARY KEY (product_id, ingredient_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
        ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Ingredient_Allergens (
    ingredient_id INT,
    allergen_id INT,
    PRIMARY KEY (ingredient_id, allergen_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
        ON DELETE CASCADE,
    FOREIGN KEY (allergen_id) REFERENCES Allergens(allergen_id)
        ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS User_Allergies (
    user_id INT,
    allergen_id INT,
    severity_level VARCHAR(50),
    PRIMARY KEY (user_id, allergen_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (allergen_id) REFERENCES Allergens(allergen_id)
        ON DELETE CASCADE
);