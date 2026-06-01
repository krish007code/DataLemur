SELECT DISTINCT card_name, max_ - min_ as difference
FROM(
SELECT 
  card_name,
  issued_amount,
  MAX(issued_amount) OVER(PARTITION BY card_name) as max_,
  MIN(issued_amount) OVER(PARTITION BY card_name) as min_
FROM monthly_cards_issued
) as subq
ORDER BY difference DESC
