
select
o.order_id,
o.customer_id,
o.order_status,
date(o.order_purchase_timestamp) as order_date,
sum(oi.price) as order_revenue,
count(oi.order_id) as total_items
from "ecommerce_db"."public"."stg_orders" o
left join "ecommerce_db"."public"."stg_order_items" oi on o.order_id=oi.order_id
group by 1,2,3,4