
  create view "ecommerce_db"."public"."stg_category_translation__dbt_tmp"
    
    
  as (
    

select
    product_category_name,
    product_category_name_english as category_name_en
from "ecommerce_db"."public"."product_category_name_translation"
  );