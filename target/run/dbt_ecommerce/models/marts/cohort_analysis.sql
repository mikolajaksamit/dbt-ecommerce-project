
  
    

  create  table "ecommerce_db"."public"."cohort_analysis__dbt_tmp"
  
  
    as
  
  (
    

with cohort_month as (
    select
        c.customer_unique_id,
        min(date_trunc('month', o.order_purchase_timestamp)) as cohort_month_date
    from "ecommerce_db"."public"."stg_orders" o
    join "ecommerce_db"."public"."stg_customers" c on o.customer_id = c.customer_id
    group by 1
),
customer_activities as (
    select
        c.customer_unique_id,
        date_trunc('month', o.order_purchase_timestamp) as order_month_date
    from "ecommerce_db"."public"."stg_customers" c
    join "ecommerce_db"."public"."stg_orders" o on o.customer_id = c.customer_id
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
  );
  