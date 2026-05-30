WITH CTE AS(
SELECT 
  measurement_value,
  date_trunc('day', measurement_time) as measurement_day,
  measurement_time,
  row_number() OVER(PARTITION BY date_trunc('day', measurement_time) ORDER BY measurement_time) AS rnk
FROM measurements)

SELECT 
  measurement_day,
  SUM(case when rnk  % 2 = 0 then measurement_value else 0 end) as even_sum,
  SUM(case when rnk  % 2 = 0 then 0 else measurement_value end) as odd_sum
  FROM CTE
GROUP BY measurement_day

