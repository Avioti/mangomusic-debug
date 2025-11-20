USE mangomusic;

SELECT 
subscription_type, 
    COUNT(ap.play_id) as total_plays,
	ROUND(COUNT(ap.play_id) * 1.0 / COUNT(DISTINCT u.user_id), 2) AS avg_plays_per_user,
   COUNT(DISTINCT u.user_id) AS total_users
FROM album_plays ap
JOIN albums al ON ap.album_id = al.album_id
JOIN users u ON ap.user_id = u.user_id
GROUP BY u.subscription_type
ORDER BY total_plays DESC;


