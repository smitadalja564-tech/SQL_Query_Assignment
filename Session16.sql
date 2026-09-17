-- Create FoodOrders Table

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    customer_name VARCHAR(100),
    order_amount DECIMAL(10,2),
    order_date DATE
);

-- Create TopSongs Table

CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(100),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs VALUES
(1,'Song A','Artist A',1500000,'2024-01-01'),
(2,'Song B','Artist B',1800000,'2024-02-15'),
(3,'Song C','Artist C',2100000,'2024-03-20'),
(4,'Song D','Artist D',1700000,'2024-04-10'),
(5,'Song E','Artist E',2500000,'2024-05-25');

-- Question 3

SELECT TOP 3
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC;

-- Question 4

SELECT
    restaurant_name,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_order_amount
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_order_amount DESC;

-- Question 5

SELECT
    'Average Order Amount' AS kpi_name,
    AVG(order_amount) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT
    'Unique Customers',
    COUNT(DISTINCT customer_name)
FROM FoodOrders;