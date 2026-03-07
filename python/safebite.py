from modules.products import list_products, show_product_allergens
from modules.users import (create_user, list_users, get_or_create_user, show_user_profile, get_safe_products, delete_user)
from modules.allergens import add_allergy_to_user, remove_allergy_from_user
from modules.safety import check_product_safety
from modules.statistics import show_allergen_statistics
import os


def clear():
    os.system("clear")

def pause():
    input("\nPress Enter to continue...")

def safe_input(prompt):
    value = input(prompt)

    if value.lower() == "exit":
        raise KeyboardInterrupt

    return value

def main():

    user_id = get_or_create_user()

    while True:

        try:

            clear()

            show_user_profile(user_id)

            list_products()

            print("\n--- SafeBite ---")
            print("1. Show product allergens")
            print("2. Check products and safety")
            print("3. Show safe products for user")
            print("4. Add allergy to user")
            print("5. Remove allergy from user")
            print("6. Show allergen statistics")
            print("7. Show users")
            print("8. Switch user")
            print("9. Delete my profile")
            print("10. Exit")

            choice = safe_input("\nChoose option: ")

            if choice == "1":
                name = safe_input("Enter product ID (type 'exit' to return): ")
                show_product_allergens(name)

            elif choice == "2":
                try:
                    product_id = int(safe_input("Enter product ID from the list above (type 'exit' to return): "))
                    check_product_safety(product_id, user_id)
                except ValueError:
                    print("Invalid input. Please enter numbers only")

            elif choice == "3":
                get_safe_products(user_id)

            elif choice == "4":
                add_allergy_to_user(user_id)

            elif choice == "5":
                remove_allergy_from_user(user_id)

            elif choice == "6":
                show_allergen_statistics()

            elif choice == "7":
                list_users()

            elif choice == "8":
                user_id = get_or_create_user()

            elif choice == "9":
                delete_user(user_id)
                print("Restart the program to create a new profile")
                break

            elif choice == "10":
                print("Exiting program.")
                break

            else:
                print("Invalid choice.")

            pause()

        except KeyboardInterrupt:
            print("\nReturning to menu...")
            pause()
            continue


if __name__ == "__main__":
    main()
