

with customers as (
    select * from "ecommerce_db"."public"."olist_customers_dataset"
),
orders as (
    select * from "ecommerce_db"."public"."olist_orders_dataset"
),
cohort_month as (
    select
        c.customer_unique_id,
        min(date_trunc('month', o.order_purchase_timestamp::timestamp)) as cohort_month_date
    from orders o
    join customers c on o.customer_id = c.customer_id
    group by 1
),
customer_activities as (
    select
        c.customer_unique_id,
        date_trunc('month', o.order_purchase_timestamp::timestamp) as order_month_date
    from customers c
    join orders o on o.customer_id = c.customer_id
    where o.order_status != 'canceled'
),
cohort_analysis as (
    select
        ca.customer_unique_id,
        cm.cohort_month_date,
        ((extract(year from ca.order_month_date) - extract(year from cm.cohort_month_date)) * 12)
        + (extract(month from ca.order_month_date) - extract(month from cm.cohort_month_date)) as month_offset
    from customer_activities ca
    join cohort_month cm on ca.customer_unique_id = cm.customer_unique_id
)
select
    to_char(cohort_month_date, 'YYYY-MM') as cohort_month,
    month_offset,
    count(distinct customer_unique_id) as unique_customers
from cohort_analysis
group by 1, 2
order by 1, 2