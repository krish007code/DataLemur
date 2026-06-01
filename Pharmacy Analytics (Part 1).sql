SELECT drug, total_profit
FROM(
SELECT
  drug,
  SUM(total_sales - cogs) OVER(PARTITION BY drug) as total_profit
FROM pharmacy_sales
) as subq
ORDER BY total_profit DESC LIMIT 3
