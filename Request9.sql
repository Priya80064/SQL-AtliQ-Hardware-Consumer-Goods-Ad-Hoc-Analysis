/* Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution?  The final output  contains these fields, 
channel 
gross_sales_mln 
percentage */

with cte as(
		   select c.channel ,
				   concat(round((sum(g.gross_price*fs.sold_quantity))/1000000,2),'M') as Gross_sales_mln
           from fact_sales_monthly fs
			 join dim_customer c
			 using (customer_code)
			 join fact_gross_price g
			 using (product_code)
			 where fs.fiscal_year = 2021
			 group by channel)

select channel,Gross_sales_mln,concat(round((Gross_sales_mln/(SELECT sum(Gross_sales_mln) FROM cte))*100 , 2) ,' %') as percentage 
from cte 
order by percentage DESC


             
