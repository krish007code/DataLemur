SELECT
  category_name,
  product_name
from(
  SELECT
    product_name,
    sales_quantity,
    category_name,
    rating,
    ROW_NUMBER() OVER(PARTITION BY category_name order by sales_quantity DESC, rating DESC) as rnk
  FROM product_sales as ps JOIN products as p
  ON ps.product_id = p.product_id
) as subq
WHERE rnk = 1
