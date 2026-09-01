{{ config(materialized='table') }}
select
    s.seller_id,
    s.seller_city,
    s.seller_state,
    sum(oi.price) as total_revenue,
    count(oi.order_id) as items_sold
from {{ ref('stg_order_items') }} oi
join {{ ref('stg_sellers') }} s on oi.seller_id = s.seller_id
group by 1, 2, 3
order by total_revenue desc