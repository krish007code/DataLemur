SELECT
  item_count from
(
  SELECT
    item_count,
    RANK() OVER(ORDER BY order_occurrences DESC) as rnk
  from items_per_order
) as subq
WHERE rnk = 1
ORDER By item_count
