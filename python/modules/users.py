from modules.db import create_connection

def create_user():
    connection = create_connection()
    cursor = connection.cursor()
    name = input("Enter user name: ")
    email = input("Enter user email: ")
    query = "INSERT INTO Users (name, email) VALUES (%s, %s)"
    cursor.execute(query, (name, email))
    connection.commit()
    print("User created successfully.")
    cursor.close()
    connection.close()

def list_users():
    connection = create_connection()
    cursor = connection.cursor()

    cursor.execute("SELECT user_id, name FROM Users")
    results = cursor.fetchall()

    print("\nUsers:")
    for row in results:
        print(f"{row[0]} - {row[1]}")

    cursor.close()
    connection.close()

def get_safe_products(user_id):
    connection = create_connection()
    cursor = connection.cursor()
    cursor.callproc("GetSafeProducts", [user_id])
    print("\nSafe products:")
    for result in cursor.stored_results():
        for row in result.fetchall():
            print(f"- {row[0]} ({row[1]})")
    cursor.close()
    connection.close()

def get_or_create_user():
    connection = create_connection()
    cursor = connection.cursor()

    name = input("Enter your name: ")

    query = "SELECT user_id FROM Users WHERE name = %s"
    cursor.execute(query, (name,))
    result = cursor.fetchone()

    if result:
        user_id = result[0]
        print(f"\nWelcome back {name}!")
    else:
        print("User not found. Creating new profile.")

        email = input("Enter email: ")

        insert_query = "INSERT INTO Users (name, email) VALUES (%s, %s)"
        cursor.execute(insert_query, (name, email))
        connection.commit()

        user_id = cursor.lastrowid
        print("Profile created!")

    cursor.close()
    connection.close()

    return user_id

def show_user_profile(user_id):
    connection = create_connection()
    cursor = connection.cursor()

    query = """
    SELECT a.name, ua.severity_level
    FROM User_Allergies ua
    JOIN Allergens a ON ua.allergen_id = a.allergen_id
    WHERE ua.user_id = %s
    """

    cursor.execute(query, (user_id,))
    results = cursor.fetchall()

    print("\n--- Your Allergies ---")

    if results:
        for row in results:
            print(f"{row[0]} (Severity: {row[1]})")
    else:
        print("No allergies registered.")

    cursor.close()
    connection.close()

def delete_user(user_id):

    connection = create_connection()
    cursor = connection.cursor()

    confirm = input("Are you sure you want to delete your profile? (yes/no): ")

    if confirm.lower() != "yes":
        print("Deletion cancelled.")
        cursor.close()
        connection.close()
        return

    query = "DELETE FROM Users WHERE user_id = %s"
    cursor.execute(query, (user_id,))
    connection.commit()

    print("User deleted successfully.")

    cursor.close()
    connection.close()