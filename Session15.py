import sqlite3
import pandas as pd

# Question 1

conn = sqlite3.connect("foodie.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS Restaurants(
    id INTEGER PRIMARY KEY,
    name TEXT,
    cuisine TEXT,
    rating REAL
)
""")

# Question 2

cursor.executemany("""
INSERT INTO Restaurants VALUES (?,?,?,?)
""",[
(1,"Spice Garden","Indian",4.5),
(2,"Pizza Hub","Italian",4.2),
(3,"Burger Point","Fast Food",3.8)
])

conn.commit()

cursor.execute(
"SELECT name FROM Restaurants WHERE rating > 4.0"
)

print(cursor.fetchall())

# Question 3

df = pd.read_sql_query(
    "SELECT * FROM Restaurants",
    conn
)

print(df.head(2))

# Question 4

df["delivery_charge"] = 50

df["final_rating"] = df.apply(
    lambda x: x["rating"] + 0.1
    if x["cuisine"] == "Italian"
    else x["rating"],
    axis=1
)

# Question 5

top_restaurants = pd.read_sql_query(
    "SELECT * FROM Restaurants WHERE rating > 4.5",
    conn
)

top_restaurants.to_csv(
    "top_rated_restaurants.csv",
    index=False
)

conn.close()