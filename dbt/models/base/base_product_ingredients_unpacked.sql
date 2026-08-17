{{ config(
    materialized='view',
    tags=['base', 'products', 'product_ingredients']
) }}


select distinct
    p.product_id,
    raw_ingredients as ingredient_name
from
    {{ source('main', 'products') }} p,
    {{ unnest_string_list('p.ingredients', 'raw_ingredients') }}
where 
    p.ingredients is not null
    and raw_ingredients != ''