
  
    

  create  table "ecommerce_db"."public"."top_sellers__dbt_tmp"
  
  
    as
  
  (
    
with order_items as (
Select * from "ecommerce_db"."public"."olist_order_items_dataset"
),
sellers as (
select * from "ecommerce_db"."public"."olist_sellers_dataset"
    ),
top_sellers as(
    SELECT s.seller_id,
           s.seller_city,
           s.seller_state,
           sum(o.price) as total_revenue,
           count(o.order_id) as items_sold
from order_items o
join sellers s on o.seller_id = s.seller_id
group by  1,2,3
)
select * from top_sellers
  );
  