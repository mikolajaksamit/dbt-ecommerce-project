
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select category
from "ecommerce_db"."public"."revenue_by_category"
where category is null



  
  
      
    ) dbt_internal_test