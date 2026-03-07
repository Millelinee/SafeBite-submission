from modules.db import create_connection

def list_allergens():
    connection = create_connection()
    cursor = connection.cursor()

    cursor.execute("SELECT allergen_id, name FROM Allergens")
    results = cursor.fetchall()

    print("\n--- Allergens ---")
    for row in results:
        print(f"{row[0]} - {row[1]}")

    cursor.close()
    connection.close()

def add_allergy_to_user(user_id):
    connection = create_connection()
    cursor = connection.cursor()

    list_allergens()

    try:
        allergen_id = int(input("Enter allergen ID: "))
    except ValueError:
        print("Invalid input. Please enter numbers.")
        return

    severity = input("Enter severity level (Low/Medium/High): ")

    query = """
        INSERT INTO User_Allergies (user_id, allergen_id, severity_level)
        VALUES (%s, %s, %s)
    """

    cursor.execute(query, (user_id, allergen_id, severity))
    connection.commit()

    print("Allergy added successfully.")

    cursor.close()
    connection.close()

def remove_allergy_from_user(user_id):

    connection = create_connection()
    cursor = connection.cursor()

    query = """
        SELECT a.allergen_id, a.name
        FROM User_Allergies ua
        JOIN Allergens a ON ua.allergen_id = a.allergen_id
        WHERE ua.user_id = %s
    """

    cursor.execute(query, (user_id,))
    results = cursor.fetchall()

    if not results:
        print("\nNo allergies to remove.")
        cursor.close()
        connection.close()
        return

    print("\n--- Your Allergies ---")
    for row in results:
        print(f"{row[0]} - {row[1]}")

    try:
        allergen_id = int(input("Enter allergen ID to remove: "))
    except ValueError:
        print("Invalid input.")
        return

    delete_query = """
        DELETE FROM User_Allergies
        WHERE user_id = %s AND allergen_id = %s
    """

    cursor.execute(delete_query, (user_id, allergen_id))
    connection.commit()

    print("Allergy removed successfully.")

    cursor.close()
    connection.close()
