
  
    

  create  table "ecommerce_db"."public"."monthly_sales_trends__dbt_tmp"
  
  
    as
  
  (
    

select
    to_char(o.order_purchase_timestamp, 'YYYY-MM') as sales_month,
    sum(oi.price) as revenue,
    count(distinct o.order_id) as total_orders
from "ecommerce_db"."public"."stg_order_items" oi
join "ecommerce_db"."public"."stg_orders" o on o.order_id = oi.order_id
where o.order_status != 'canceled'
group by 1
order by 1 asc
  );
  