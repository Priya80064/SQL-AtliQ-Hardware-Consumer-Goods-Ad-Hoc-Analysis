/* Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
segment 
product_count_2020 
product_count_2021 
difference
*/

with x as (
			select segment, count(distinct(p.product_code)) as product_count_2020 
			from dim_product p
            join fact_sales_monthly f
            using (product_code)
			where fiscal_year = 2020
            group by segment) , 
     y as (
			select segment, count(distinct(p.product_code)) as product_count_2021
			from  dim_product p
            join  fact_sales_monthly f
            using (product_code)
			where fiscal_year = 2021
            group by segment)
 
select x.segment,product_count_2020,product_count_2021,
(product_count_2021-product_count_2020) as difference
from x 
join y 
using(segment)
order by difference desc;
