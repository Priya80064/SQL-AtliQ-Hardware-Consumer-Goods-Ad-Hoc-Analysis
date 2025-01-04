/*Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
Month 
Year 
Gross sales Amount */

select monthname(fs.date) as month , fs.fiscal_year as year ,
	   round(sum(g.gross_price*fs.sold_quantity),2) as Gross_sales_amount
from fact_sales_monthly fs
 join dim_customer c
 using (customer_code)
 join fact_gross_price g
 using (product_code)
 where c.customer = "AtliQ Exclusive"
 group by month,year
 order by year