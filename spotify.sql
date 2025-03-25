SELECT * FROM spotify_table;

--Easy Level
--Retrieve the names of all tracks that have more than 1 billion streams.

SELECT track,stream FROM spotify_table
WHERE stream > 1000000000;

--List all albums along with their respective artists.

SELECT album,artist FROM spotify_table;

--Get the total number of comments for tracks where licensed = TRUE.

SELECT track,SUM(comments) total_comments FROM spotify_table
WHERE licensed='true'
GROUP BY track;

--Find all tracks that belong to the album type single.

SELECT track FROM spotify_table
WHERE album_type='single';

--Count the total number of tracks by each artist.
SELECT artist,COUNT(track) total_tracks FROM spotify_table
GROUP BY artist;

--Medium Level
--Calculate the average danceability of tracks in each album.

SELECT album,AVG(danceability) FROM spotify_table
GROUP BY album;

--Find the top 5 tracks with the highest energy values.

SELECT track,energy_liveness FROM spotify_table
WHERE energy_liveness IS NOT NULL
ORDER BY energy_liveness DESC
LIMIT 5;

--List all tracks along with their views and likes where official_video = TRUE.

SELECT track,views,likes FROM spotify_table
WHERE official_video='TRUE';
--For each album, calculate the total views of all associated tracks.

SELECT album,track,SUM(views) total_views FROM spotify_table
GROUP BY album,track;

--Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT track FROM spotify_table
WHERE (SELECT COUNT(*) FROM spotify_table WHERE most_played_on='Spotify')>(SELECT COUNT(*) FROM spotify_table WHERE most_played_on='Youtube');

--Advanced Level
--Find the top 3 most-viewed tracks for each artist using window functions.

WITH artist_rank AS(
	SELECT artist,track,SUM(views) total_views,
	ROW_NUMBER() OVER(PARTITION BY artist ORDER BY SUM(views) DESC) AS rank
	FROM spotIfy_table
	GROUP BY artist,track
	)
SELECT artist,track,total_views
FROM artist_rank
WHERE rank<=3
ORDER BY artist,rank;

--Write a query to find tracks where the liveness score is above the average.

SELECT track,liveness
FROM spotIfy_table
WHERE liveness > (SELECT AVG(liveness) FROM spotIfy_table);

--Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

 WITH energy_values AS(
	 SELECT album,MAX(energy) AS high_energy,MIN(energy) AS low_energy
	 FROM spotIfy_table
	 GROUP BY album
 )
SELECT album,(high_energy-low_energy) AS energy_difference
FROM energy_values
ORDER BY energy_difference DESC;

--Find tracks where the energy-to-liveness ratio is greater than 1.2.

SELECT track,(energy/liveness) AS energy_live_ratio
FROM spotIfy_table
WHERE liveness>0 AND (energy/liveness)>1.2;

--Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

SELECT track,views,likes,
SUM(likes) OVER(ORDER BY views DESC) AS cumulative_sum
FROM spotify_table
ORDER BY views DESC;

CREATE INDEX idx_artist ON spotify_table(artist);
