

with unique_geo as (
    select
        geolocation_zip_code_prefix,
        max(geolocation_city) as geolocation_city,
        max(geolocation_state) as geolocation_state
    from "ecommerce_db"."public"."stg_geography"
    group by 1
)

select
    c.customer_id,
    g.geolocation_city,
    g.geolocation_state,
    count(distinct o.order_id) as total_orders,
    sum(oi.price) as total_revenue
from "ecommerce_db"."public"."stg_customers" c
left join unique_geo g on c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
left join "ecommerce_db"."public"."stg_orders" o on c.customer_id = o.customer_id
left join "ecommerce_db"."public"."stg_order_items" oi on o.order_id = oi.order_id
group by 1, 2, 3