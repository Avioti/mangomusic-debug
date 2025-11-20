USE mangomusic;

-- REPORT 4: Monthly Active Users by Country
-- Business need: Geographic breakdown of engaged users
-- Count unique users who played at least one album per month, by country

SELECT 
    u.country,
    DATE_FORMAT(ap.played_at, '%Y-%m') as activity_month,
    COUNT(DISTINCT u.user_id) as monthly_active_users
FROM album_plays ap
JOIN users u ON ap.user_id = u.user_id
WHERE ap.played_at >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) 
GROUP BY u.country, activity_month
ORDER BY activity_month DESC, monthly_active_users DESC;