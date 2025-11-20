USE mangomusic;

SELECT 
u.country as 'Country',
    COUNT(ap.play_id) as total_plays,
       ROUND(COUNT(ap.play_id) * 1.0 / COUNT(DISTINCT u.user_id), 2) AS avg_plays_per_user,
   COUNT(DISTINCT u.user_id) AS total_users
FROM users u
JOIN album_plays ap ON ap.user_id = u.user_id
GROUP BY u.country
ORDER BY total_plays DESC
LIMIT 15
;
