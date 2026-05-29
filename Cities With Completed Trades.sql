SELECT DISTINCT city, COUNT(*) OVER (PARTITION BY city) as total_orders
FROM trades as T LEFT OUTER JOIN users as U
ON T.user_id = U.user_id 
WHERE status = 'Completed'
ORDER BY total_orders DESC LIMIT 3;
