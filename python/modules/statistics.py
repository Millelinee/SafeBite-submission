from modules.db import create_connection

def show_allergen_statistics():
    connection = create_connection()
    cursor = connection.cursor()
    query = """
        SELECT a.name, COUNT(DISTINCT pi.product_id) AS product_count
        FROM Allergens a
        JOIN Ingredient_Allergens ia ON a.allergen_id = ia.allergen_id
        JOIN Product_Ingredients pi ON ia.ingredient_id = pi.ingredient_id
        GROUP BY a.name
        ORDER BY product_count DESC
    """
    cursor.execute(query)
    results = cursor.fetchall()
    print("\nNumber of products containing each allergen:")
    for row in results:
        print(f"{row[0]}: {row[1]} products")
    cursor.close()
    connection.close()