--   Provide the list of markets in which customer  "Atliq  Exclusive" operates its business in the  APAC  region. 

Select distinct market from dim_customer
where customer = "AtliQ Exclusive" and region = "APAC"
order by market