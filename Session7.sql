-- Create Orders Table

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO Orders VALUES
(1,'Amit',500,'2025-01-01'),
(2,'Rahul',750,'2025-01-02'),
(3,'Priya',NULL,'2025-01-03'),
(4,'Amit',650,'2025-01-04'),
(5,'Neha',900,'2025-01-05');


-- Question 2

SELECT
    user_name,
    COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;


-- Question 3

SELECT
    AVG(total_amount) AS average_order_amount
FROM Orders;


-- Question 4

SELECT
    MAX(total_amount) AS highest_order_amount,
    MIN(total_amount) AS lowest_order_amount
FROM Orders;


-- Question 5

SELECT
    SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;