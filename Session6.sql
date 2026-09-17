-- Question 1

SELECT TOP 5 *
FROM Products
ORDER BY price ASC;


-- Question 2

SELECT *
FROM Products
ORDER BY price DESC;


-- Question 3

SELECT *
FROM Movies
ORDER BY release_year DESC,
         rating DESC;


-- Question 4

SELECT TOP 10 *
FROM Restaurants
ORDER BY name ASC;


-- Question 5

SELECT TOP 3 *
FROM Songs
ORDER BY play_count DESC,
         added_date DESC;