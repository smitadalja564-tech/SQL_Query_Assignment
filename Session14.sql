-- Question 1: Create Orders table and insert 7 sample records

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(101,1,'2025-01-01',250.00),
(102,1,'2025-01-05',400.00),
(103,2,'2025-01-02',300.00),
(104,2,'2025-01-10',500.00),
(105,1,'2025-01-15',350.00),
(106,3,'2025-01-08',450.00),
(107,3,'2025-01-12',600.00);


-- Question 2: Previous order amount using LAG()

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER(
        PARTITION BY user_id
        ORDER BY order_date
    ) AS previous_order_amount
FROM Orders;


-- Question 3: Next order amount using LEAD()

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER(
        PARTITION BY user_id
        ORDER BY order_date
    ) AS next_order_amount
FROM Orders;


-- Question 4: Running total of total_amount

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER(
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Orders;


-- Question 5: 3-order moving average

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    AVG(total_amount) OVER(
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average 
FROM Orders;