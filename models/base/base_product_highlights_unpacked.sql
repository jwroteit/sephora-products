{{ config(
    materialized='view',
    tags=['base', 'products', 'product_highlights']
) }}


select distinct
    p.product_id,
    raw_highlights as highlight_name
from
    {{ source('main', 'products') }} p,
    {{ unnest_string_list('p.highlights', 'raw_highlights') }}
where 
    p.highlights is not null
    and raw_highlights != ''