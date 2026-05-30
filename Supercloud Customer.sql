select customer_id
from customer_contracts as cc join products as p
on cc.product_id = p.product_id 
group by customer_id having count(distinct product_category) = (SELECT COUNT(DISTINCT product_category) from products) 
