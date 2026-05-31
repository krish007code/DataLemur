SELECT 
  card_name,
  issued_amount FROM
(
SELECT
  card_name,
  issue_year,
  issue_month,
  issued_amount,
  ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) as rnk
FROM monthly_cards_issued
)as subq
where rnk = 1
order by issued_amount DESC
