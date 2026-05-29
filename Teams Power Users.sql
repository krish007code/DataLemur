SELECT 
  DISTINCT sender_id,
  COUNT(*) OVER (PARTITION BY sender_id) as count_messages
FROM messages
WHERE sent_date > '2022-08-01' AND sent_date < '2022-09-01'
ORDER BY count_messages DESC LIMIT 2
;
