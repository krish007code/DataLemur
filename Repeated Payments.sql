WITH payments AS (
  SELECT 
    merchant_id, 
    EXTRACT(
      EPOCH FROM LEAD(transaction_timestamp) OVER(
        PARTITION BY merchant_id, credit_card_id, amount 
        ORDER BY transaction_timestamp
      ) - transaction_timestamp
    ) / 60 AS minute_difference   
  FROM transactions
) 
SELECT 
  COUNT(merchant_id) AS payment_count
FROM payments 
WHERE minute_difference <= 10;
