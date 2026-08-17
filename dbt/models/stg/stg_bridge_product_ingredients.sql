{{ config(
    materialized='table',
    tags=['staging', 'bridge']
) }}

with unpacked as (
    select
        product_id,
        ingredient_name
    from 
        {{ ref('base_product_ingredients_unpacked') }}
),

dim_ingredients as (
    select
        ingredient_id,
        ingredient_name
    from 
        {{ ref('base_dim_product_ingredients') }}
)

select distinct
    u.product_id,
    i.ingredient_id
from 
    unpacked u
inner join 
    dim_ingredients i
    on u.ingredient_name = i.ingredient_name