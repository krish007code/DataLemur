SELECT 
    age_bucket,
    ROUND(SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END)/ SUM(CASE WHEN activity_type in ('send', 'open') THEN time_spent ELSE 0 END) * 100, 2) AS send_perc,
    ROUND(SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END)/ SUM(CASE WHEN activity_type in ('send', 'open') THEN time_spent ELSE 0 END) * 100, 2) AS open_perc
FROM activities act
LEFT JOIN age_breakdown ab ON act.user_id = ab.user_id
WHERE activity_type IN ('send', 'open')
GROUP BY age_bucket;
