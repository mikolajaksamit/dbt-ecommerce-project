
  create view "ecommerce_db"."public"."stg_sellers__dbt_tmp"
    
    
  as (
    

select
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
from "ecommerce_db"."public"."olist_sellers_dataset"
  );