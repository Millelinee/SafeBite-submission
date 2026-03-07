from modules.db import create_connection

def list_products():
    connection = create_connection()
    cursor = connection.cursor()

    query = "SELECT product_id, name, brand FROM Products"
    cursor.execute(query)

    results = cursor.fetchall()

    print("\n========== Available Products ==========")

    for row in results:
        print(f"{row[0]:>2} | {row[1]} ({row[2]})")

    print("========================================")

    cursor.close()
    connection.close()


def show_product_allergens(product_id):
    connection = create_connection()
    cursor = connection.cursor()
    query = """
        SELECT DISTINCT a.name
        FROM Products p
        JOIN Product_Ingredients pi ON p.product_id = pi.product_id
        JOIN Ingredient_Allergens ia ON pi.ingredient_id = ia.ingredient_id
        JOIN Allergens a ON ia.allergen_id = a.allergen_id
        WHERE p.product_id = %s
    """
    cursor.execute(query, (product_id,))
    results = cursor.fetchall()
    if results:
        print("\nAllergens in this product:")
        for row in results:
            print("-", row[0])
    else:
        print("No allergens found or product does not exist.")
    cursor.close()
    connection.close()