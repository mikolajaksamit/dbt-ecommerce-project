
  
    

  create  table "ecommerce_db"."public"."mrt_top_sellers__dbt_tmp"
  
  
    as
  
  (
    

select
    s.seller_id,
    s.seller_city,
    s.seller_state,
    DATE(o.order_purchase_timestamp) as order_date, -- Rzutowanie na samą datę
    sum(oi.price) as total_revenue,
    count(oi.order_id) as items_sold
from "ecommerce_db"."public"."stg_order_items" oi
join "ecommerce_db"."public"."stg_sellers" s on oi.seller_id = s.seller_id
left join "ecommerce_db"."public"."stg_orders" o on o.order_id = oi.order_id
group by 1, 2, 3, 4
order by total_revenue desc
  );
  