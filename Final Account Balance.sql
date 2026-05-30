WITH CTE AS (
SELECT 
  account_id,
  CASE WHEN transaction_type = 'Deposit' then amount else amount * -1 end as abs_amount
FROM transactions
)
SELECT account_id, SUM(abs_amount) as final_balance FROM CTE GROUP BY account_id
