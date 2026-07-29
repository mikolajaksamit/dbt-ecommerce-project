
  
    

  create  table "ecommerce_db"."public"."mrt_cohort_analysis__dbt_tmp"
  
  
    as
  
  (
    

with customer_orders as (

    select
        c.customer_unique_id,
        date_trunc(
            'month',
            o.order_purchase_timestamp
        )::date as order_month

    from "ecommerce_db"."public"."stg_orders" o

    inner join "ecommerce_db"."public"."stg_customers" c
        on o.customer_id = c.customer_id

    where o.order_status != 'canceled'

),

cohort_month as (

    select
        customer_unique_id,
        min(order_month) as cohort_month

    from customer_orders

    group by customer_unique_id

),

cohort_activity as (

    select
        co.customer_unique_id,
        cm.cohort_month,
        co.order_month,

        (
            extract(year from co.order_month)
            - extract(year from cm.cohort_month)
        ) * 12
        +
        (
            extract(month from co.order_month)
            - extract(month from cm.cohort_month)
        ) as month_offset

    from customer_orders co

    inner join cohort_month cm
        on co.customer_unique_id = cm.customer_unique_id

)

select
    cohort_month,
    month_offset,
    count(distinct customer_unique_id) as active_customers

from cohort_activity

group by
    cohort_month,
    month_offset

order by
    cohort_month,
    month_offset
  );
  