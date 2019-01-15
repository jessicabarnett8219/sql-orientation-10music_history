-- Query all of the entries in the Genre table
SELECT * FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist
VALUES (null, "The National", 2001)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album
VALUES (null, "The Boxer", "12/01/2008", "2467", "Label1", 30, 2)

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO SONG
VALUES (null, "Fake Empire", 124, "12/13/2008", 2, 30, 23)

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT Song.title, Album.title, Artist.ArtistName
FROM Song
  LEFT JOIN Album
	ON song.AlbumId = Album.AlbumId
	LEFT JOIN ARTIST
    ON Album.ArtistId = Artist.ArtistId
WHERE Album.AlbumId = 23

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT Album.Title, COUNT(Song.ArtistId)
FROM Song
LEFT JOIN Album
ON Song.AlbumId = Album.AlbumId
GROUP BY song.AlbumId

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Artist.ArtistName, COUNT(Song.ArtistId)
FROM Song
LEFT JOIN Artist
ON Song.ArtistId = Artist.ArtistId
GROUP BY song.ArtistId

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Genre.label, COUNT(Song.GenreId)
FROM Song
LEFT JOIN Genre
ON Song.GenreId = Genre.GenreId
GROUP BY song.GenreId

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Album.Title, Album.AlbumLength, MAX(Album.AlbumLength)
FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Song.Title, Song.SongLength, MAX(Song.SongLength)
FROM Song

-- Modify the previous query to also display the title of the album.
SELECT Song.Title, Song.SongLength, Album.Title as AlbumTitle, MAX(Song.SongLength)
FROM Song
LEFT JOIN Album
ON Song.AlbumId = Album.AlbumId