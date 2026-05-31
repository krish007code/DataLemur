SELECT distinct
  transaction_date,
  user_id,
  COUNT(*) OVER (PARTITION BY user_id) as purchase_count
FROM
( 
  SELECT
    transaction_date,
    user_id,
    DENSE_RANK() OVER(PARTITION BY user_id order by transaction_date DESC) as rnk
  FROM user_transactions
) as subq
WHERE rnk = 1
