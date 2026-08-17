{{ config(
    materialized='view',
    tags=['base', 'facts', 'product_snapshot']
) }}

select
    product_id,
    {{ generate_surrogate_key([clean_string('brand_name')]) }} as brand_id,
    {{ generate_surrogate_key(['primary_category', 'secondary_category', 'tertiary_category']) }} as category_id,
    cast(price_usd as double) as price_usd,
    cast(value_price_usd as double) as value_price_usd,
    cast(sale_price_usd as double) as sale_price_usd,
    cast(loves_count as int) as loves_count,
    cast(rating as double) as rating,
    cast(reviews as int) as reviews_count
from 
    {{ source('main', 'products') }}