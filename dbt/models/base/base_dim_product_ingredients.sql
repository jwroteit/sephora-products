{{ config(
    materialized='view',
    tags=['base', 'products', 'product_ingredients']
) }}

with parsed_ingredients as (
    select distinct
        ingredients as ingredient_name
    from 
        {{ source('main', 'products') }} p,
        {{ unnest_string_list('p.ingredients', 'raw_item') }}
    where 
        ingredients is not null
)

select
    {{ generate_surrogate_key(['ingredient_name']) }} as ingredient_id,
    ingredient_name
from 
    parsed_ingredients
where 
    ingredient_name is not null 
    and ingredient_name != ''