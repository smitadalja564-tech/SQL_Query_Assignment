-- Create MusicPlaylist Table

CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

INSERT INTO MusicPlaylist VALUES
(1,'Perfect','Ed Sheeran','Pop',263),
(2,'Believer','Imagine Dragons','Rock',204),
(3,'Shape of You','Ed Sheeran','Pop',233),
(4,'Kesariya','Arijit Singh','Bollywood',270),
(5,'Levitating','Dua Lipa','Pop',203);


-- Question 2

SELECT TOP 3
    song_name,
    artist
FROM MusicPlaylist;


-- Question 3

SELECT DISTINCT restaurant
FROM FoodOrders;


-- Question 4

SELECT
    food_item AS Dish,
    order_date AS Date_Ordered
FROM FoodOrders;


-- Question 5

-- Incorrect Query

SELECT DISTINCT TOP 2 food_item, restaurant
FROM FoodOrders;

-- Correct Query

SELECT DISTINCT TOP 2 food_item, restaurant
FROM FoodOrders;