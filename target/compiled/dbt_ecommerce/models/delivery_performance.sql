
with orders as (
Select * from "ecommerce_db"."public"."olist_orders_dataset"
),
customers as(
SELECT * FROM "ecommerce_db"."public"."olist_customers_dataset"
),
delivery_performace as(
SELECT
c.customer_state,
avg(extract(day from order_delivered_customer_date::timestamp -
order_purchase_timestamp::timestamp)) as avg_delivery_days,
sum(case when order_delivered_customer_date > order_estimated_delivery_date then 1 else 0 end) as delayed_orders
FROM orders o
join customers c on c.customer_id=o.customer_id
where o.order_status = 'delivered'
group by 1
)
select * from delivery_performace