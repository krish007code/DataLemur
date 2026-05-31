SELECT 
  user_id
FROM emails as e JOIN texts as t
ON e.email_id = t.email_id
WHERE
signup_action = 'Confirmed' and 
signup_date + INTERVAL '1 day' = action_date;
