/* Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? The final output contains these 
fields, 
division 
product_code 
product 
total_sold_quantity 
rank_order*/


with  x as (
				select p.division, p.product_code, p.product,sum(s.sold_quantity) as total_sold_quantity
				from dim_product p
				join fact_sales_monthly s
				using (product_code)
				where fiscal_year = 2021
				group by p.product_code
				order by total_sold_quantity),
y as 
	        (select 
                     *,
                     dense_rank() over (partition by division order by total_sold_quantity desc) as drnk
                from x)
select * from y
where drnk <= 3
order by division, drnk


             

           
	