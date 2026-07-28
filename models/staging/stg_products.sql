{{ config(materialized='view') }}

select
    product_id,
    product_category_name
from {{ source('ecommerce_raw', 'olist_products_dataset') }}