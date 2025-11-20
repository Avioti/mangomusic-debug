USE mangomusic;

-- REPORT 1: Daily Active Users Report
-- Business need: Track platform engagement day-by-day
-- Shows unique users who played at least one album each day for the past 30 days

SELECT 
    DATE(played_at) as activity_date,
    COUNT(DISTINCT user_id) as daily_active_users
FROM album_plays
WHERE played_at <= DATE_SUB(CURDATE(), INTERVAL 30 DAY) -- i changed it to less than because the date you gave us below is 2024 
GROUP BY DATE(played_at)
ORDER BY activity_date DESC;

SELECT COUNT(DISTINCT user_id) FROM album_plays WHERE DATE(played_at) = '2024-11-18';