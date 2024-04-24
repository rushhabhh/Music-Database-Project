-- Creating tables --
-- Create new table for users in music system--
CREATE TABLE USER (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL UNIQUE,
    Email VARCHAR(255) NOT NULL UNIQUE,
    DateJoined DATETIME DEFAULT CURRENT_TIMESTAMP,
    IsPremium BOOLEAN DEFAULT FALSE
);

-- Create new table for genre of the music, the type of genre (genrename is pre decided)--
CREATE TABLE GENRE (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName ENUM('Pop', 'Rock', 'Jazz', 'Classical', 'Hip Hop', 'Electronic', 'Country', 'Other', 'Hard Rock', 'Classic Rock', 'Punk', 'Progressive Rock', 'New Wave', 'Bebop', 'Swing', 'Heavy Metal', 'Blues', 'Blues Rock', 'Avant Garde', 'Rhythm & Blues') NOT NULL
);

-- Create new table for artist which includes information about id, name, country and year start date--
CREATE TABLE ARTIST (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    ArtistName VARCHAR(255) NOT NULL,
    Country VARCHAR(255),
    YearActiveStart YEAR NOT NULL
);

-- Create new music_album table which includes album id, name, release year and genre id --
CREATE TABLE MUSIC_ALBUM (
    AlbumID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumName VARCHAR(255) NOT NULL,
    ReleaseYear YEAR NOT NULL,
    GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES GENRE(GenreID)
);

-- Create new table for music_track which includes information about track, genre, name duration and date released--
CREATE TABLE MUSIC_TRACK (
    TrackID INT AUTO_INCREMENT PRIMARY KEY,
    AlbumID INT NOT NULL,
    GenreID INT,
    TrackName VARCHAR(255) NOT NULL,
    Duration TIME NOT NULL,
    ReleaseDate DATE NOT NULL,
    FOREIGN KEY (AlbumID) REFERENCES MUSIC_ALBUM(AlbumID),
    FOREIGN KEY (GenreID) REFERENCES GENRE(GenreID)
);

-- Create new table for user review --
CREATE TABLE USER_REVIEW (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    MusicTrackID INT NOT NULL,
    ReviewText TEXT,
    Rating DECIMAL(3,2) NOT NULL,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES USER(UserID),
    FOREIGN KEY (MusicTrackID) REFERENCES MUSIC_TRACK(TrackID)
);

-- Create new table for ARTIST_ABLUM --
CREATE TABLE ARTIST_ALBUM (
    ArtistAlbumID INT AUTO_INCREMENT PRIMARY KEY,
    ArtistID INT NOT NULL,
    AlbumID INT NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES MUSIC_ALBUM(AlbumID)
);


-- Inserting values in table -- 
-- Inserting values in table USER -- 
INSERT INTO USER (UserName, Email, DateJoined, IsPremium) VALUES
('User1', 'abc@wisc.edu', '2024-01-01', TRUE),
('User2', 'user2@wisc.edu', '2024-01-02', FALSE),
('User3', 'xyz@wisc.com', '2024-01-02', TRUE),
('User4', 'user4@wisc.com', '2024-01-03', TRUE),
('User5', 'adm@uw.com', '2024-01-04', TRUE),
('User6', 'jake@uw.edu', '2024-01-05', TRUE),
('User7', 'rushabh@asu.edu', '2024-01-05', FALSE),
('User8', 'harsh@example.com', '2024-01-05', FALSE),
('User9', 'hello@wisc.com', '2024-01-06', FALSE),
('User10', 'world@wisc.com', '2024-01-09', FALSE),
('User11',  'minii@wisc.com', '2024-01-10', TRUE),
('User12', 'rath@hello.com', '2024-01-10', FALSE),
('User13', 'spottedcow@gmail.com', '2024-01-10', FALSE),
('User14', 'greenbay@yahoo.com', '2024-01-10', TRUE),
('User15', 'master@uw.com', '2024-01-11', FALSE);


-- Inserting values in table GENRE -- 
INSERT INTO GENRE (GenreName) VALUES
('Hard Rock'),
('Classic Rock'),
('Punk'),
('Progressive Rock'),
('New Wave'),
('Jazz'),
('Bebop'),
('Swing'),
('Classical'),
('Heavy Metal'),
('Blues'),
('Blues Rock'),
('Avant Garde'),
('Rhythm & Blues'),
('Country');


-- Insert Values in table ARTIST --
INSERT INTO ARTIST (ArtistName, Country, YearActiveStart) VALUES
('Bob Dylan', 'USA', 1962),
('The Beatles', 'UK', 1960),
('The Clash', 'UK', 1976),
('The Who', 'UK', 1964),
('King Crimson', 'UK', 1968),
('Genesis', 'UK', 1967),
('Talking Heads', 'USA', 1975),
('Charlie Parker', 'USA', 1940),
('John Coltrane', 'USA', 1955),
('Benny Goodman', 'USA', 1934),
('Beethoven', 'Germany', 1992),
('Black Sabbath', 'UK', 1968),
('Frank Zappa', 'USA', 1966),
('BB King', 'USA', 1948),
('Hank Williams', 'USA', 1943);


-- Insert Values in table MUSIC_ALBUM --
INSERT INTO MUSIC_ALBUM (AlbumName, ReleaseYear, GenreID) VALUES
('Highway 61 Revisited', 1965, (SELECT GenreID FROM GENRE WHERE GenreName = 'Classic Rock')),
('London Calling', 1979, (SELECT GenreID FROM GENRE WHERE GenreName = 'Punk')),
('Who’s Next', 1971, (SELECT GenreID FROM GENRE WHERE GenreName = 'Hard Rock')),
('In the Court of the Crimson King', 1969, (SELECT GenreID FROM GENRE WHERE GenreName = 'Progressive Rock')),
('Selling England by the Pound', 1973, (SELECT GenreID FROM GENRE WHERE GenreName = 'Progressive Rock')),
('Remain in Light', 1980, (SELECT GenreID FROM GENRE WHERE GenreName = 'New Wave')),
('Bird and Diz', 1950, (SELECT GenreID FROM GENRE WHERE GenreName = 'Bebop')),
('A Love Supreme', 1965, (SELECT GenreID FROM GENRE WHERE GenreName = 'Jazz')),
('Sing, Sing, Sing', 1938, (SELECT GenreID FROM GENRE WHERE GenreName = 'Swing')),
('Symphony No. 9', 1924, (SELECT GenreID FROM GENRE WHERE GenreName = 'Classical')),
('Paranoid', 1970, (SELECT GenreID FROM GENRE WHERE GenreName = 'Heavy Metal')),
('Freak Out', 1966, (SELECT GenreID FROM GENRE WHERE GenreName = 'Avant Garde')),
('Live at the Regal', 1965, (SELECT GenreID FROM GENRE WHERE GenreName = 'Blues')),
('Led Zeppelin IV', 1971, (SELECT GenreID FROM GENRE WHERE GenreName = 'Blues Rock')),
('Mansion on the Hill', 1948, (SELECT GenreID FROM GENRE WHERE GenreName = 'Country'));


-- Insert Values in table MUSIC_TRACK --
INSERT INTO MUSIC_TRACK (AlbumID, GenreID, TrackName, Duration, ReleaseDate) VALUES
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 1), (SELECT GenreID FROM GENRE WHERE GenreName = 'Classic Rock'), 'Like a Rolling Stone', '00:06:13', '1965-07-20'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 2), (SELECT GenreID FROM GENRE WHERE GenreName = 'Punk'), 'London Calling', '00:03:20', '1979-12-14'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 3), (SELECT GenreID FROM GENRE WHERE GenreName = 'Hard Rock'), 'Baba O’Riley', '00:05:00', '1971-08-14'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 4), (SELECT GenreID FROM GENRE WHERE GenreName = 'Progressive Rock'), '21st Century Schizoid Man', '00:07:21', '1969-10-10'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 5), (SELECT GenreID FROM GENRE WHERE GenreName = 'Progressive Rock'), 'I Know What I Like (In Your Wardrobe)', '00:04:07', '1973-03-01'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 6), (SELECT GenreID FROM GENRE WHERE GenreName = 'New Wave'), 'Once in a Lifetime', '00:04:19', '1980-10-08'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 7), (SELECT GenreID FROM GENRE WHERE GenreName = 'Bebop'), 'Ko-Ko', '00:02:55', '1950-01-01'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 8), (SELECT GenreID FROM GENRE WHERE GenreName = 'Jazz'), 'Acknowledgement', '00:07:47', '1965-02-01'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 9), (SELECT GenreID FROM GENRE WHERE GenreName = 'Swing'), 'Sing, Sing, Sing', '00:08:40', '1938-01-01'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 10), (SELECT GenreID FROM GENRE WHERE GenreName = 'Classical'), 'Ode to Joy', '00:17:44', '1924-05-07'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 11), (SELECT GenreID FROM GENRE WHERE GenreName = 'Heavy Metal'), 'Paranoid', '00:02:50', '1970-09-18'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 12), (SELECT GenreID FROM GENRE WHERE GenreName = 'Avant Garde'), 'Who Are the Brain Police?', '00:03:34', '1966-06-27'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 13), (SELECT GenreID FROM GENRE WHERE GenreName = 'Blues'), 'Sweet Little Angel', '00:03:49', '1965-11-21'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 14), (SELECT GenreID FROM GENRE WHERE GenreName = 'Blues Rock'), 'Stairway to Heaven', '00:08:03', '1971-11-08'),
((SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 15), (SELECT GenreID FROM GENRE WHERE GenreName = 'Country'), 'Mansion on the Hill', '00:02:34', '1948-01-01');


-- Insert Values in table USER_REVIEW --
INSERT INTO USER_REVIEW (UserID, MusicTrackID, ReviewText, Rating, ReviewDate) VALUES
((SELECT USERID FROM USER WHERE USERID = 1), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 1), 'Great track!', 4.5, '2024-03-01'),
((SELECT USERID FROM USER WHERE USERID = 2), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 2), 'Amazing song', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 3), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 3), 'Love it!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 4), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 4), 'Great track!!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 5), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 5), 'Love it!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 6), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 6), 'Great track!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 7), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 7), 'Love it!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 8), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 8), 'Great track!', 4.5, '2024-03-01'),
((SELECT USERID FROM USER WHERE USERID = 9), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 9), 'Amazing song', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 10), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 10), 'Love it!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 11), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 11), 'Great track!!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 12), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 12), 'Love it!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 13), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 13), 'Love it!', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 14), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 14), 'Amazing song', 4.8, '2024-03-02'),
((SELECT USERID FROM USER WHERE USERID = 15), (SELECT TrackID FROM MUSIC_TRACK WHERE TrackID = 15), 'Love it!', 4.8, '2024-03-02');


-- Insert Values in table ARTIST_ALBUM --
INSERT INTO ARTIST_ALBUM (ArtistID, AlbumID) VALUES
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 1), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 1)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 2), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 2)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 3), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 3)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 4), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 4)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 5), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 5)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 6), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 6)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 7), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 7)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 8), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 8)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 9), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 9)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 10), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 10)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 11), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 11)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 12), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 12)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 13), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 13)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 14), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 14)),
((SELECT ArtistID FROM ARTIST WHERE ArtistID = 15), (SELECT AlbumID FROM MUSIC_ALBUM WHERE AlbumID = 15));


-- Query 1 --
-- Retrieve music tracks and their corresponding genre names --
CREATE VIEW vw_TrackGenre AS
SELECT GENRE.GenreName, MUSIC_TRACK.TrackName, MUSIC_TRACK.Duration
FROM MUSIC_TRACK
JOIN GENRE ON MUSIC_TRACK.GenreID = GENRE.GenreID;


-- Query 2 --
-- List all albums and the artists associated with them --
CREATE VIEW vw_AlbumArtist AS
SELECT MUSIC_ALBUM.AlbumName, MUSIC_ALBUM.ReleaseYear, ARTIST.ArtistName
FROM ARTIST_ALBUM
JOIN ARTIST ON ARTIST_ALBUM.ArtistID = ARTIST.ArtistID
JOIN MUSIC_ALBUM ON ARTIST_ALBUM.AlbumID = MUSIC_ALBUM.AlbumID;


-- Query 3 --
-- Retrieve all user reviews, including track name and user name --
CREATE VIEW vw_UserReview AS
SELECT USER.UserName, MUSIC_TRACK.TrackName, USER_REVIEW.ReviewText, USER_REVIEW.Rating
FROM USER_REVIEW
JOIN USER ON USER_REVIEW.UserID = USER.UserID
JOIN MUSIC_TRACK ON USER_REVIEW.MusicTrackID = MUSIC_TRACK.TrackID;


-- Query 4 --
-- List all tracks in a specific album, including album name and track name --
CREATE VIEW vw_AlbumTrack AS
SELECT MUSIC_ALBUM.AlbumName, MUSIC_TRACK.TrackName
FROM MUSIC_TRACK
JOIN MUSIC_ALBUM ON MUSIC_TRACK.AlbumID = MUSIC_ALBUM.AlbumID;


-- Query 5 --
-- Count the number of tracks in each genre --
CREATE VIEW vw_GenreTrackCount AS
SELECT GENRE.GenreName, COUNT(MUSIC_TRACK.TrackID) AS NumberOfTracks
FROM MUSIC_TRACK
JOIN GENRE ON MUSIC_TRACK.GenreID = GENRE.GenreID
GROUP BY GENRE.GenreName;


-- Query 6 --
-- Retreive the review from the database for users who have a premium account --
CREATE VIEW vw_PremiumUserReview AS
SELECT USER.UserName, USER_REVIEW.ReviewText, USER_REVIEW.Rating
FROM USER
JOIN USER_REVIEW ON USER.UserID = USER_REVIEW.UserID
WHERE USER.IsPremium = TRUE;


-- Query 7 --
--  Retrieve the artist name, album name, genre name, and the release year of albums --
CREATE VIEW vw_ArtistAlbumGenre AS
SELECT ARTIST.ArtistName, MUSIC_ALBUM.AlbumName, GENRE.GenreName, MUSIC_ALBUM.ReleaseYear
FROM ARTIST_ALBUM
JOIN ARTIST ON ARTIST_ALBUM.ArtistID = ARTIST.ArtistID
JOIN MUSIC_ALBUM ON ARTIST_ALBUM.AlbumID = MUSIC_ALBUM.AlbumID
JOIN GENRE ON MUSIC_ALBUM.GenreID = GENRE.GenreID;


-- View Queries
SELECT * FROM vw_TrackGenre;
SELECT * FROM vw_AlbumArtist;
SELECT * FROM vw_UserReview;
SELECT * FROM vw_AlbumTrack;
SELECT * FROM vw_GenreTrackCount;
SELECT * FROM vw_PremiumUserReview;
SELECT * FROM vw_ArtistAlbumGenre;