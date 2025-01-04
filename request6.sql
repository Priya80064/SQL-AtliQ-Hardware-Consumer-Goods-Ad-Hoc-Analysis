/* Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
customer_code 
customer 
average_discount_percentage */

select c.customer_code, c.customer, round(avg(pre_invoice_discount_pct*100),2) as average_discount_percentage
from dim_customer c
join fact_pre_invoice_deductions pre
using (customer_code)
where c.market = "india" and pre.fiscal_year = 2021
group by customer
order by average_discount_percentage desc 
limit 5;