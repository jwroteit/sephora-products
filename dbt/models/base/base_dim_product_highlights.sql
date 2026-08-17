{{ config(
    materialized='view',
    tags=['base', 'products', 'product_highlights']
) }}

select 
    distinct
    {{ generate_surrogate_key(['highlight_name']) }} as highlight_id,
    highlight_name
from 
    {{ ref('base_product_highlights_unpacked') }}