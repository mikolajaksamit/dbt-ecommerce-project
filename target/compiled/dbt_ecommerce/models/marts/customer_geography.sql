

select
    g.geolocation_city,
    g.geolocation_state,
    count(distinct c.customer_id) as unique_customers,
    avg(g.geolocation_lat) as avg_lat,
    avg(g.geolocation_lng) as avg_lng
from "ecommerce_db"."public"."stg_customers" c
join "ecommerce_db"."public"."stg_geography" g on c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
group by 1, 2