
{{ config(
    materialized='view',
    tags=['base', 'products', 'product_categories']
) }}

with distinct_categories as (
    select distinct
        coalesce(primary_category, 'N/A') as primary_category,
        coalesce(secondary_category, 'N/A') as secondary_category,
        coalesce(tertiary_category, 'N/A') as tertiary_category
    from 
        {{ source('main', 'products') }}
)

select
    {{ generate_surrogate_key(['primary_category', 'secondary_category', 'tertiary_category']) }} as category_id,
    primary_category,
    secondary_category,
    tertiary_category
from 
    distinct_categories