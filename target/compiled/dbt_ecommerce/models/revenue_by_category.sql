

with order_items as (
Select * from "ecommerce_db"."public"."olist_order_items_dataset"
),
products as (
Select * from "ecommerce_db"."public"."olist_products_dataset"
),
category as (
Select * from "ecommerce_db"."public"."product_category_name_translation"
),
revenue_calculation as(
    select c.product_category_name_english as category,
           count(p.product_id) as total,
           sum(o.price) as revenue,
           avg(o.price) as avg_price
    from order_items o
           join products p on p.product_id=o.product_id
           join category c on c.product_category_name=p.product_category_name
           group by 1
)
select * from revenue_calculation