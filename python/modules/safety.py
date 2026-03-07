from modules.db import create_connection

def check_product_safety(product_id, user_id):
    connection = create_connection()
    cursor = connection.cursor()
    query = "SELECT IsProductSafe(%s, %s)"
    cursor.execute(query, (product_id, user_id))
    result = cursor.fetchone()
    if result and result[0] == 1:
        print("\n**Product is SAFE for this user.**\n")
    else:
        print("\n**Product is NOT SAFE for this user.**\n")

        query = """
        SELECT a.name, ua.severity_level
        FROM User_Allergies ua
        JOIN Ingredient_Allergens ia ON ua.allergen_id = ia.allergen_id
        JOIN Product_Ingredients pi ON ia.ingredient_id = pi.ingredient_id
        JOIN Allergens a ON ua.allergen_id = a.allergen_id
        WHERE ua.user_id = %s AND pi.product_id = %s
    """

        cursor.execute(query, (user_id, product_id))
        matches = cursor.fetchall()

        if matches:
            print("Conflicting allergens:")
            for row in matches:
                print(f"- {row[0]} (Severity: {row[1]})")

    cursor.close()
    connection.close()