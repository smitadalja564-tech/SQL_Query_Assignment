-- Create Tables

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO Restaurants VALUES
(1,'Spice Garden','Ahmedabad'),
(2,'Pizza Hub','Surat'),
(3,'Food Palace','Vadodara');

INSERT INTO Dishes VALUES
(1,1,'Paneer Tikka',250),
(2,1,'Veg Biryani',200),
(3,2,'Margherita Pizza',300);