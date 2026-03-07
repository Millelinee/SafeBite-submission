
-- SafeBite Stored Procedures & Functions

USE SafeBite;

-- PROCEDURE: GetSafeProducts
-- Returns all safe products for a given user

DELIMITER //

CREATE PROCEDURE GetSafeProducts(IN input_user_id INT)
BEGIN
    SELECT p.name, p.brand
    FROM Products p
    WHERE p.product_id NOT IN (
        SELECT DISTINCT p2.product_id
        FROM Products p2
        JOIN Product_Ingredients pi
            ON p2.product_id = pi.product_id
        JOIN Ingredient_Allergens ia
            ON pi.ingredient_id = ia.ingredient_id
        JOIN User_Allergies ua
            ON ia.allergen_id = ua.allergen_id
        WHERE ua.user_id = input_user_id
    );
END //

DELIMITER ;

-- FUNCTION: IsProductSafe
-- Returns TRUE if product is safe for user

DELIMITER //

CREATE FUNCTION IsProductSafe(p_id INT, u_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

    DECLARE unsafe_count INT;

    SELECT COUNT(*)
    INTO unsafe_count
    FROM Product_Ingredients pi
    JOIN Ingredient_Allergens ia
        ON pi.ingredient_id = ia.ingredient_id
    JOIN User_Allergies ua
        ON ia.allergen_id = ua.allergen_id
    WHERE pi.product_id = p_id
    AND ua.user_id = u_id;

    RETURN unsafe_count = 0;

END //

DELIMITER ;