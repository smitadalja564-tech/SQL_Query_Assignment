-- Question 1: Display total songs uploaded by each artist and show only artists with more than 3 songs

SELECT artist_name,
       COUNT(*) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(*) > 3;


-- Question 2: Display username with total order amount

SELECT u.username,
       SUM(o.amount) AS total_order_amount
FROM users u
JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.username;


-- Question 3: Find restaurants whose rating is greater than average rating

SELECT name,
       rating
FROM restaurants
WHERE rating >
(
    SELECT AVG(rating)
    FROM restaurants
);


-- Question 4: Display transaction amount with running total

SELECT
    user_id,
    amount,
    transaction_date,
    SUM(amount) OVER(
        PARTITION BY user_id
        ORDER BY transaction_date
    ) AS running_total
FROM transactions;


-- Question 5: Query optimization techniques

/*
1. Create indexes on frequently searched columns such as
   category and price to improve search performance.

2. Avoid using SELECT *.
   Retrieve only required columns to reduce processing time
   and improve query execution speed.
*/