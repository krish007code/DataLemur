WITH CTE1 AS (
SELECT user_id, date_trunc('day', transaction_date) + INTERVAL '1 day' as t1 FROM transactions
),
CTE2 AS (
SELECT user_id, date_trunc('day', transaction_date) + INTERVAL '2 day' as t2 from transactions 
)
SELECT t0.user_id from transactions as t0 inner join CTE1 ON t0.transaction_date = CTE1.t1
inner join CTE2 on t0.transaction_date = CTE2.t2
WHERE t0.user_id = CTE1.user_id and t0.user_id = CTE2.user_id;
