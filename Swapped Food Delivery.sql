WITH CTE AS
(
SELECT
  order_id,
  item,
  LAG(item, 1) OVER() AS lag,
  LEAD(item, 1) OVER() AS lead
FROM orders
)
SELECT
  order_id,
  COALESCE(case when order_id % 2 = 0 then lag else lead end, item) as ans
from CTE
