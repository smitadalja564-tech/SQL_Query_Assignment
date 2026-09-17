-- Create Playlists Table

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO Playlists VALUES
(1,101,'Bollywood Hits',500),
(2,101,'Workout Mix',300),
(3,102,'Chill Vibes',450),
(4,102,'Travel Songs',200),
(5,103,'Romantic Songs',600),
(6,103,'Dance Party',550),
(7,104,'Study Playlist',250),
(8,104,'Top English Hits',400);


-- Question 2: Assign row number by likes

SELECT
    id,
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER(
        ORDER BY total_likes DESC
    ) AS row_num
FROM Playlists;


-- Question 3: Rank playlists by likes

SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER(
        ORDER BY total_likes DESC
    ) AS ranking
FROM Playlists;


-- Question 4: Dense rank playlists within each user

SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER(
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS dense_rank
FROM Playlists;


-- Question 5: Show top 2 playlists per user

WITH RankedPlaylists AS
(
    SELECT
        id,
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER(
            PARTITION BY user_id
            ORDER BY total_likes DESC
        ) AS rn
    FROM Playlists
)

SELECT *
FROM RankedPlaylists
WHERE rn <= 2;