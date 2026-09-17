-- Create Playlist Table

CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);

-- Question 1 : Insert a single favorite song

INSERT INTO Playlist
VALUES (1,'Excuses','AP Dhillon',210);


-- Question 2 : Insert 3 more songs

INSERT INTO Playlist
VALUES
(2,'Brown Munde','AP Dhillon',240),
(3,'Kesariya','Arijit Singh',270),
(4,'Believer','Imagine Dragons',204);


-- Question 3 : Update artist name to fix typo

UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE artist = 'Arjit Singh';


-- Question 4 : Delete songs with duration less than 120 seconds

DELETE FROM Playlist
WHERE duration < 120;


-- Question 5 : Add '(Remix)' to songs by AP Dhillon
-- only if duration is greater than 180 seconds

UPDATE Playlist
SET song_name = CONCAT(song_name,' (Remix)')
WHERE artist = 'AP Dhillon'
AND duration > 180;