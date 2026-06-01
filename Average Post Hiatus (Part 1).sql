SELECT DISTINCT
  user_id, 
  EXTRACT('days' from maximum - minimum) as days_between
FROM
(
SELECT 
  user_id,
  MAX(post_date) OVER(PARTITION BY user_id ) as maximum,
  MIN(post_date) OVER(PARTITION BY user_id) as minimum
FROM posts
WHERE 
  post_date > '2021-01-01' AND
  post_date < '2021-12-31'
)as subq
WHERE EXTRACT('days' from maximum - minimum) != 0
ORDER BY days_between
