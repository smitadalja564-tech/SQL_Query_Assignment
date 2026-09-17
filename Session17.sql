-- Question 1: Create Restaurant table and insert 5 sample records

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    location VARCHAR(100),
    average_rating DECIMAL(2,1)
);

INSERT INTO Restaurant VALUES
(1,'Biryani House','North Indian','Koramangala',4.5),
(2,'Pizza Hub','Italian','Indiranagar',4.2),
(3,'Spice Garden','North Indian','HSR Layout',4.7),
(4,'Dragon Wok','Chinese','Whitefield',4.3),
(5,'Burger Point','Fast Food','MG Road',4.1);


-- Question 2: Number of restaurants for each cuisine type

SELECT cuisine,
       COUNT(*) AS total_restaurants
FROM Restaurant
GROUP BY cuisine
ORDER BY total_restaurants DESC;


-- Question 3: Create Review table and insert sample reviews

CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(50),
    rating DECIMAL(2,1),
    review_date DATE
);

INSERT INTO Review VALUES
(1,1,'Amit',5.0,'2025-01-01'),
(2,1,'Rahul',4.0,'2025-01-02'),
(3,2,'Priya',4.5,'2025-01-03'),
(4,2,'Neha',4.0,'2025-01-04'),
(5,3,'Ravi',5.0,'2025-01-05'),
(6,3,'Karan',4.5,'2025-01-06'),
(7,4,'Anjali',4.0,'2025-01-07'),
(8,4,'Pooja',4.5,'2025-01-08'),
(9,5,'Vikas',4.0,'2025-01-09'),
(10,5,'Meera',4.5,'2025-01-10');


-- Question 4: Restaurant name, cuisine and average review rating

SELECT r.name,
       r.cuisine,
       AVG(rv.rating) AS average_review_rating
FROM Restaurant r
JOIN Review rv
ON r.id = rv.restaurant_id
GROUP BY r.id,r.name,r.cuisine
ORDER BY average_review_rating DESC;


-- Question 5: Rank restaurants by average rating within each cuisine

SELECT
    r.name,
    r.cuisine,
    AVG(rv.rating) AS average_rating,
    DENSE_RANK() OVER(
        PARTITION BY r.cuisine
        ORDER BY AVG(rv.rating) DESC
    ) AS ranking
FROM Restaurant r
JOIN Review rv
ON r.id = rv.restaurant_id
GROUP BY r.id,r.name,r.cuisine;