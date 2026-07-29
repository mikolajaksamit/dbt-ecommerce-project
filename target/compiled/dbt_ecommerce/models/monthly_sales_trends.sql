
with order_items as (
Select * from "ecommerce_db"."public"."olist_order_items_dataset"
),
orders as (
SELECT * FROM "ecommerce_db"."public"."olist_orders_dataset"
),
monthly_sales_trends as(
SELECT
to_char(cast(order_purchase_timestamp as timestamp), 'YYYY-MM') as sales_month,
sum(price) as revenue,
count(distinct o.order_id)
FROM order_items oi
join orders o on o.order_id = oi.order_id
where o.order_status != 'cancelled'
group by 1
order by sales_month asc
)
select * from monthly_sales_trends