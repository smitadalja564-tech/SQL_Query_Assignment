-- Question 1: Products with rating above 4.5

WITH TopRatedProducts AS
(
    SELECT *
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;


-- Question 2: Restaurants in Ahmedabad with delivery charge below 50

WITH AffordableRestaurants AS
(
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
    AND delivery_charge < 50
)
SELECT *
FROM AffordableRestaurants;


-- Question 3: Top 3 most-followed users and top 3 most-liked posts

WITH TopUsers AS
(
    SELECT TOP 3 *
    FROM Users
    ORDER BY followers DESC
),
TopPosts AS
(
    SELECT TOP 3 *
    FROM Posts
    ORDER BY likes DESC
)

SELECT * FROM TopUsers;

SELECT * FROM TopPosts;


-- Question 4: Generate next 7 dates using Recursive CTE

WITH DateSeries AS
(
    SELECT CAST(GETDATE() AS date) AS dt

    UNION ALL

    SELECT DATEADD(day, 1, dt)
    FROM DateSeries
    WHERE dt < DATEADD(day, 6, CAST(GETDATE() AS date))
)
SELECT *
FROM DateSeries;


-- Question 5: Users with more than 1000 followers

WITH PopularUsers AS
(
    SELECT *
    FROM Users
    WHERE followers > 1000
)
SELECT *
FROM PopularUsers;