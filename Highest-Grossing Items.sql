select
  category, product, total_spend from(
  SELECT
    category,
    product,
    SUM(spend) as total_spend,
    RANK() over(partition by category order by SUM(spend) DESC) as rnk
    FROM product_spend
    WHERE EXTRACT(year from transaction_date) = '2022'
    GROUP BY category, product
) as subq
WHERE rnk < 3 ;
