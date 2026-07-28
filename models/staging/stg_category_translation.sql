{{ config(materialized='view') }}

select
    product_category_name,
    product_category_name_english as category_name_en
from {{ source('ecommerce_raw', 'product_category_name_translation') }}