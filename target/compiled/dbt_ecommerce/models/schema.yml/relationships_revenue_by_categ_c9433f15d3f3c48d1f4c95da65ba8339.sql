
    
    

with child as (
    select category as from_field
    from "ecommerce_db"."public"."revenue_by_category"
    where category is not null
),

parent as (
    select product_category_name_english as to_field
    from "ecommerce_db"."public"."product_category_name_translation"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


