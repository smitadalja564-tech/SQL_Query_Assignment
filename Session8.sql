-- Create Orders Table

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1,101,'UPI',500),
(2,102,'Card',700),
(3,103,'Wallet',250),
(4,101,'UPI',450),
(5,104,'COD',300),
(6,102,'Card',800),
(7,103,'Wallet',350),
(8,105,'UPI',600);


-- Question 2 : Count orders by payment method

SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY payment_method;


-- Question 3 : Total amount spent by each user

SELECT
    user_id,
    SUM(amount) AS total_spent
FROM Orders
GROUP BY user_id;


-- Question 4 : Payment methods with average amount greater than 300

SELECT
    payment_method,
    AVG(amount) AS average_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;


-- Question 5 : Difference between WHERE and HAVING

-- WHERE Example

SELECT *
FROM Orders
WHERE amount > 300;

-- HAVING Example

SELECT
    payment_method,
    AVG(amount) AS avg_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

/*
WHERE filters individual rows before grouping.

HAVING filters grouped results after aggregation.
*/