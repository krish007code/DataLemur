with cte as(
SELECT
  filing_id,
  user_id,
  extract('year' from filing_date) as year,
  substring(product from '\w+(?=\s)') as s,
  count(*) over(partition by user_id) as count
FROM filed_taxes
where substring(product from '\w+(?=\s)') = 'TurboTax'
order by count desc
)
select distinct
   user_id
from cte 
where count >= 3
