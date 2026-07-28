{{ config(materialized='table') }}

select
    c.category_name_en as category,
    count(oi.product_id) as items_sold,
    sum(oi.price) as revenue,
    avg(oi.price) as avg_price
from {{ ref('stg_order_items') }} oi
join {{ ref('stg_products') }} p on p.product_id = oi.product_id
join {{ ref('stg_category_translation') }} c on c.product_category_name = p.product_category_name
group by 1
order by revenue desc