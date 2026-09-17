-- Create Restaurants Table

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    city VARCHAR(50)
);

INSERT INTO Restaurants VALUES
(1,'Swagat','Indian',4.5,'Ahmedabad'),
(2,'Swadisht','North Indian',4.2,'Surat'),
(3,'Pizza Hub','Italian',3.8,'Mumbai'),
(4,'Dragon Wok','Chinese',4.1,'Ahmedabad'),
(5,'Udupi Cafe','South Indian',4.4,'Surat');


-- Question 2

SELECT *
FROM Restaurants
WHERE rating > 4.0
AND city IN ('Ahmedabad','Surat');


-- Question 3

SELECT *
FROM Restaurants
WHERE name LIKE 'Swa%';


-- Question 4

SELECT *
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;


-- Question 5

SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese','Italian','South Indian');