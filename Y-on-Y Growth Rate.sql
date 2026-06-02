WITH CTE AS(
SELECT
  product_id,
  EXTRACT('year' from transaction_date ) as year,
  SUM(spend) OVER(PARTITION BY product_id, transaction_date) as curr_year_spend,
  LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date) as prev_year_spend
FROM user_transactions
)
SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND((curr_year_spend - prev_year_spend) * 100 / prev_year_spend , 2) as yoy_rate
FROM CTE
  
