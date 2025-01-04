/* In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity */

Select 
	CASE 
		WHEN MONTH(date) in (9,10,11) THEN "Q1"
		WHEN MONTH(date) in (12,1,2) THEN "Q2"
		WHEN MONTH(date) in (3,4,5) THEN "Q3"
		ELSE "Q4"
	END AS Quarter,
    sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year = 2020
group by quarter 
order by total_sold_quantity desc

