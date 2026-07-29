
  
    

  create  table "ecommerce_db"."public"."customer_geography__dbt_tmp"
  
  
    as
  
  (
    
with customers as (
Select * from "ecommerce_db"."public"."olist_customers_dataset"
),
geography as (
SELECT * FROM "ecommerce_db"."public"."olist_geolocation_dataset"
),
customer_geography as(
select
g.geolocation_city,
g.geolocation_state,
count(distinct customer_id) as unique_customer,
avg(g.geolocation_lat) as avg_lat,
avg(g.geolocation_lng) as avg_lng
from customers c
join geography g on c.customer_zip_code_prefix=g.geolocation_zip_code_prefix
group by 1,2
)
select * from customer_geography
  );
  