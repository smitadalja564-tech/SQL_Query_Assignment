-- Create Tables

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

-- Question 1 : List all influencers and their collaboration partners

SELECT
    i.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM Influencers i
FULL JOIN Collaborations c
ON i.id = c.influencer1_id
FULL JOIN Influencers i2
ON c.influencer2_id = i2.id;


-- Question 2 : Display playlists with parent playlist names

SELECT
    p1.playlist_name,
    p2.playlist_name AS parent_playlist
FROM Playlists p1
LEFT JOIN Playlists p2
ON p1.parent_playlist_id = p2.id;


-- Question 3 : Display all users with order date and payment amount

SELECT
    u.username,
    o.order_date,
    p.amount
FROM Users u
LEFT JOIN Orders o
ON u.id = o.user_id
LEFT JOIN Payments p
ON o.id = p.order_id;


-- Question 4 : Remove duplicate restaurant rows

SELECT
    r.restaurant_name,
    AVG(rv.rating) AS average_rating
FROM Restaurants r
JOIN Reviews rv
ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id,
         r.restaurant_name;

-- Explanation:
-- Duplicates occur because one restaurant can have multiple reviews,
-- creating multiple rows during JOIN.


-- Question 5 : Two JOIN queries for Products and Categories

SELECT
    p.product_name,
    c.category_name
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;


SELECT
    p.product_name,
    c.category_name
FROM Products p
LEFT JOIN Categories c
ON p.category_id = c.category_id;

-- INNER JOIN is generally more efficient because it returns
-- only matching records.