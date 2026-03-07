import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password= "root123",
            database="SafeBite"
        )
        return connection

    except Error as e:
        print("Database connection error:", e)
        exit()