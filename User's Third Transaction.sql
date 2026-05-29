SELECT user_id, spend, transaction_date
FROM (
    SELECT *, 
           RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ) AS rn
    FROM transactions
) AS ranked
WHERE rn = 3;
