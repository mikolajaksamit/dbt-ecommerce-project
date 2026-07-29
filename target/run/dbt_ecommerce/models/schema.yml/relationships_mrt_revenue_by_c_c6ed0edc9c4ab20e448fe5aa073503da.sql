
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select category as from_field
    from "ecommerce_db"."public"."mrt_revenue_by_category"
    where category is not null
),

parent as (
    select category_name_en as to_field
    from "ecommerce_db"."public"."stg_category_translation"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test