
  create view "ecommerce_db"."public"."stg_products__dbt_tmp"
    
    
  as (
    

select
    product_id,
    product_category_name
from "ecommerce_db"."public"."olist_products_dataset"
  );