/*  Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, 
product_code 
product 
manufacturing_cost
*/

select p.product_code,p.product,m.manufacturing_cost
from dim_product p
join fact_manufacturing_cost as m
using(product_code)
where manufacturing_cost 
IN ( 
	SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
    UNION
    SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
    ) 
order by manufacturing_cost desc
