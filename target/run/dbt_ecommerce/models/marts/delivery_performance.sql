
  
    

  create  table "ecommerce_db"."public"."delivery_performance__dbt_tmp"
  
  
    as
  
  (
    

select
    c.customer_state,
    avg(extract(day from o.order_delivered_customer_date - o.order_purchase_timestamp)) as avg_delivery_days,
    sum(case when o.order_delivered_customer_date > o.order_estimated_delivery_date then 1 else 0 end) as delayed_orders
from "ecommerce_db"."public"."stg_orders" o
join "ecommerce_db"."public"."stg_customers" c on c.customer_id = o.customer_id
where o.order_status = 'delivered'
group by 1
  );
  