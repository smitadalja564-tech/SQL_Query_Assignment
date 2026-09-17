-- Question 1: Restaurants with rating higher than average rating

SELECT *
FROM Restaurants
WHERE average_rating >
(
    SELECT AVG(average_rating)
    FROM Restaurants
);


-- Question 2: Display each user and total orders placed

SELECT
    u.user_name,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.user_id = u.user_id
    ) AS total_orders
FROM Users u;


-- Question 3: Movies having at least one 5-star review

SELECT *
FROM Movies
WHERE movie_id IN
(
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);


-- Question 4: Sellers who have sold products in every category

SELECT seller_name
FROM Sellers s
WHERE NOT EXISTS
(
    SELECT category_id
    FROM Categories c
    WHERE NOT EXISTS
    (
        SELECT *
        FROM SellerProducts sp
        WHERE sp.seller_id = s.seller_id
        AND sp.category_id = c.category_id
    )
);