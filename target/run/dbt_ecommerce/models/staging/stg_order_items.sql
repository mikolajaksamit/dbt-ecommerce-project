
  create view "ecommerce_db"."public"."stg_order_items__dbt_tmp"
    
    
  as (
    

select
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date::timestamp as shipping_limit_date,
    price::numeric as price,
    freight_value::numeric as freight_value
from "ecommerce_db"."public"."olist_order_items_dataset"
  );