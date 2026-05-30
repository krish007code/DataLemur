WITH CTE AS (
  SELECT 
    app_id,
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS total_clicks,
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS total_impressions
  FROM events
  WHERE events.timestamp > '2022-01-01' and events.timestamp < '2023-01-01'
  GROUP BY app_id
)
SELECT 
  app_id,
  ROUND(total_clicks * 100.0 / total_impressions, 2) AS ctr
FROM CTE
ORDER BY app_id DESC;
