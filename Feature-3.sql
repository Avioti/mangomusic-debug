USE mangomusic;

SELECT 
art.primary_genre as 'Genre',
    COUNT(ap.play_id) as total_plays,
   COUNT(DISTINCT art.artist_id) AS total_artist,
   COUNT(DISTINCT a.album_id) AS 'Total albums'
FROM album_plays ap
JOIN albums a ON ap.album_id = a.album_id
JOIN artists art ON a.artist_id = art.artist_id
GROUP BY art.primary_genre
ORDER BY total_plays DESC;
