SELECT 
  COALESCE(a.user_id, d.user_id) as user_id,
  CASE 
      WHEN d.user_id IS NULL THEN 'CHURN'
      WHEN a.status = 'CHURN' THEN 'RESURRECT'
      WHEN a.user_id is NULL then 'NEW'
      ELSE 'EXISTING' 
  END
FROM 
    advertiser AS a 
full OUTER JOIN 
    daily_pay AS d ON a.user_id = d.user_id
order by user_id
