
    
    

select
    category as unique_field,
    count(*) as n_records

from "ecommerce_db"."public"."revenue_by_category"
where category is not null
group by category
having count(*) > 1


